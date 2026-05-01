import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import api from '../api/axios';
import { useAuth } from '../context/AuthContext';
import { MapPin, IndianRupee, Calendar, Users, Navigation } from 'lucide-react';
import { toast } from 'react-hot-toast';

export default function ServiceDetail() {
  const { id } = useParams();
  const [service, setService] = useState(null);
  
  // Booking Form State
  const [date, setDate] = useState(new Date().toISOString().split('T')[0]); // booking_date
  const [travelers, setTravelers] = useState(1);
  
  const [startDate, setStartDate] = useState('');
  const [endDate, setEndDate] = useState('');
  
  const [fromPlace, setFromPlace] = useState('');
  const [toPlace, setToPlace] = useState('');
  const [travelDate, setTravelDate] = useState('');

  const { user } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    const fetchService = async () => {
      try {
        const res = await api.get(`/services/${id}`);
        setService(res.data);
        
        // Set Defaults based on User Request
        const data = res.data;
        const today = new Date().toISOString().split('T')[0];
        
        setStartDate(today);
        setTravelDate(today);
        
        if (data.to_place) {
          setToPlace(data.to_place);
        } else if (data.location) {
          setToPlace(data.location);
        }
        
        if (data.from_place) {
          setFromPlace(data.from_place);
        }
      } catch (err) {
        console.error(err);
      }
    };
    fetchService();
  }, [id]);

  const calculateTotalPrice = () => {
    if (!service) return 0;
    
    let days = 1;
    if ((service.type === 'hotel' || service.type === 'package') && startDate && endDate) {
      const sDate = new Date(startDate);
      const eDate = new Date(endDate);
      const diffTime = eDate - sDate;
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
      if (diffDays > 0) {
        days = diffDays;
      }
    }
    
    return service.price * travelers * days;
  };

  const handleBooking = async (e) => {
    e.preventDefault();
    if (!user) {
      toast.error('Please login to book');
      navigate('/login');
      return;
    }

    const today = new Date();
    today.setHours(0, 0, 0, 0);

    // Frontend Validations
    if (service.type === 'hotel' || service.type === 'package') {
      if (!startDate || !endDate) return toast.error('Please select start and end dates');
      if (new Date(endDate) < new Date(startDate)) return toast.error('End date must be after start date');
    } else if (service.type === 'flight' || service.type === 'train') {
      if (!fromPlace || !toPlace || !travelDate) return toast.error('Please fill in all travel details');
    }

    try {
      const totalPrice = calculateTotalPrice();
      const res = await api.post('/bookings', {
        service_id: service.id,
        date, // Generic booking date
        travelers,
        total_price: totalPrice,
        start_date: startDate,
        end_date: endDate,
        from_place: fromPlace,
        to_place: toPlace,
        travel_date: travelDate
      });
      navigate(`/payment/${res.data.id}`, { state: { amount: totalPrice } });
    } catch (err) {
      toast.error(err.response?.data?.message || 'Booking failed');
    }
  };

  if (!service) return <div className="text-center py-12">Loading...</div>;

  const isHotelOrPackage = service.type === 'hotel' || service.type === 'package';

  return (
    <div className="bg-white rounded-2xl shadow-sm overflow-hidden">
      <div className="h-64 md:h-96 relative bg-gray-200">
        <img
          src={service.image || `https://source.unsplash.com/1200x800/?${service.type},travel`}
          alt={service.title}
          className="w-full h-full object-cover"
        />
        <div className="absolute top-4 right-4 bg-white/90 px-4 py-2 rounded-full font-bold text-blue-600 shadow">
          {service.type.toUpperCase()}
        </div>
      </div>
      
      <div className="p-8 flex flex-col md:flex-row gap-8">
        <div className="flex-1 space-y-6">
          <h1 className="text-3xl font-bold text-gray-900">{service.title}</h1>
          <div className="flex items-center text-gray-600 text-lg">
            <MapPin className="h-5 w-5 mr-2 text-red-500" />
            {service.location || (service.from_place && service.to_place ? `${service.from_place} to ${service.to_place}` : 'Location unavailable')}
          </div>
          
          {(service.start_date && service.end_date) && (
            <div className="flex items-center text-gray-600">
              <Calendar className="h-5 w-5 mr-2 text-blue-500" />
              Service Available: {new Date(service.start_date).toLocaleDateString()} - {new Date(service.end_date).toLocaleDateString()}
            </div>
          )}
          {service.travel_date && (
            <div className="flex items-center text-gray-600">
              <Calendar className="h-5 w-5 mr-2 text-blue-500" />
              Service Date: {new Date(service.travel_date).toLocaleDateString()}
            </div>
          )}

          <div className="prose max-w-none text-gray-700">
            <p>{service.description || 'Enjoy a wonderful experience with our premium service. Book now to secure your spot!'}</p>
          </div>
        </div>
        
        <div className="w-full md:w-96 bg-gray-50 p-6 rounded-xl border border-gray-100">
          <div className="text-3xl font-bold text-gray-900 mb-6 flex items-center">
            <IndianRupee className="h-8 w-8 text-green-600" />
            {Number(service.price).toFixed(2)}
            <span className="text-sm text-gray-500 font-normal ml-2">/ {isHotelOrPackage ? 'day / person' : 'person'}</span>
          </div>
          
          <form onSubmit={handleBooking} className="space-y-4">
            
            {isHotelOrPackage ? (
              <>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                    <Calendar className="h-4 w-4 mr-1" /> Check-in Date
                  </label>
                  <input
                    type="date"
                    required
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                    value={startDate}
                    onChange={(e) => setStartDate(e.target.value)}
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                    <Calendar className="h-4 w-4 mr-1" /> Check-out Date
                  </label>
                  <input
                    type="date"
                    required
                    min={startDate}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                    value={endDate}
                    onChange={(e) => setEndDate(e.target.value)}
                  />
                </div>
              </>
            ) : (
              <>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                    <Navigation className="h-4 w-4 mr-1" /> From
                  </label>
                  <input
                    type="text"
                    required
                    placeholder="Enter origin city"
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                    value={fromPlace}
                    onChange={(e) => setFromPlace(e.target.value)}
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                    <MapPin className="h-4 w-4 mr-1" /> To
                  </label>
                  <input
                    type="text"
                    required
                    placeholder="Enter destination city"
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                    value={toPlace}
                    onChange={(e) => setToPlace(e.target.value)}
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                    <Calendar className="h-4 w-4 mr-1" /> Travel Date
                  </label>
                  <input
                    type="date"
                    required
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                    value={travelDate}
                    onChange={(e) => setTravelDate(e.target.value)}
                  />
                </div>
              </>
            )}

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                <Users className="h-4 w-4 mr-1" /> Travelers
              </label>
              <input
                type="number"
                min="1"
                required
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                value={travelers}
                onChange={(e) => setTravelers(Number(e.target.value))}
              />
            </div>
            
            <div className="pt-4 border-t border-gray-200 mt-4">
              <div className="flex justify-between text-lg font-bold mb-4">
                <span>Total:</span>
                <span className="flex items-center"><IndianRupee className="h-5 w-5 mr-0.5" /> {Number(calculateTotalPrice()).toFixed(2)}</span>
              </div>
              <button
                type="submit"
                className="w-full py-3 bg-blue-600 text-white font-bold rounded-lg hover:bg-blue-700 transition"
              >
                Book Now
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
