import { useState, useEffect } from 'react';
import api from '../api/axios';
import { toast } from 'react-hot-toast';
import { Calendar, Users, DollarSign, XCircle, CheckCircle, Clock } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function UserDashboard() {
  const [bookings, setBookings] = useState([]);
  const [cancelModal, setCancelModal] = useState({ isOpen: false, booking: null });

  const fetchBookings = async () => {
    try {
      const res = await api.get('/bookings/user');
      setBookings(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    fetchBookings();
  }, []);

  const openCancelModal = (booking) => {
    setCancelModal({ isOpen: true, booking });
  };

  const closeCancelModal = () => {
    setCancelModal({ isOpen: false, booking: null });
  };

  const confirmCancel = async () => {
    try {
      await api.put(`/bookings/${cancelModal.booking.id}/cancel`);
      toast.success('Booking Cancelled');
      fetchBookings();
      closeCancelModal();
    } catch (err) {
      toast.error('Failed to cancel booking');
    }
  };

  const getStatusDisplay = (booking) => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const bookingDate = new Date(booking.date);
    bookingDate.setHours(0, 0, 0, 0);

    if (booking.status === 'CANCELLED') {
      return { text: 'Cancelled', icon: <XCircle className="h-5 w-5 text-red-500" /> };
    } else if (bookingDate < today) {
      return { text: 'Completed', icon: <CheckCircle className="h-5 w-5 text-gray-500" /> };
    } else if (booking.status === 'CONFIRMED') {
      return { text: 'Upcoming', icon: <CheckCircle className="h-5 w-5 text-green-500" /> };
    }
    return { text: booking.status, icon: <Clock className="h-5 w-5 text-yellow-500" /> };
  };

  return (
    <div>
      <h2 className="text-3xl font-bold text-gray-900 mb-8">My Bookings</h2>
      
      {bookings.length > 0 ? (
        <div className="space-y-6">
          {bookings.map((booking) => {
            const today = new Date();
            today.setHours(0, 0, 0, 0);
            const bookingDate = new Date(booking.date);
            bookingDate.setHours(0, 0, 0, 0);
            const isPast = bookingDate < today;
            const disableCancel = isPast || booking.status === 'CANCELLED';
            const statusDisplay = getStatusDisplay(booking);

            return (
              <div key={booking.id} className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col md:flex-row gap-6 relative">
                <div className="w-full md:w-48 h-32 bg-gray-200 rounded-xl overflow-hidden flex-shrink-0">
                  <img src={booking.image || `https://source.unsplash.com/400x300/?${booking.type},travel`} alt={booking.title} className="w-full h-full object-cover" />
                </div>
                
                <div className="flex-1 space-y-3">
                  <div className="flex justify-between items-start">
                    <div>
                      <h3 className="text-xl font-bold text-gray-900">{booking.title}</h3>
                      <p className="text-gray-500">{booking.location}</p>
                    </div>
                    <div className="flex items-center space-x-2 bg-gray-50 px-3 py-1 rounded-full border border-gray-200">
                      {statusDisplay.icon}
                      <span className="font-semibold text-sm">{statusDisplay.text}</span>
                    </div>
                  </div>
                  
                  <div className="flex flex-wrap gap-4 text-gray-600 text-sm">
                    <div className="flex items-center"><Calendar className="h-4 w-4 mr-1" /> {new Date(booking.date).toLocaleDateString()}</div>
                    <div className="flex items-center"><Users className="h-4 w-4 mr-1" /> {booking.travelers} Travelers</div>
                    <div className="flex items-center font-bold text-gray-900"><DollarSign className="h-4 w-4 mr-1" /> ${Number(booking.total_price).toFixed(2)}</div>
                  </div>
                </div>
                
                <div className="flex flex-col justify-end space-y-2 md:w-40 border-t md:border-t-0 pt-4 md:pt-0">
                  {booking.status === 'PENDING' && !isPast && (
                    <Link
                      to={`/payment/${booking.id}`}
                      state={{ amount: booking.total_price }}
                      className="w-full py-2 bg-blue-600 text-white text-center font-medium rounded-lg hover:bg-blue-700 transition"
                    >
                      Pay Now
                    </Link>
                  )}
                  <div className="relative group">
                    <button
                      onClick={() => openCancelModal(booking)}
                      disabled={disableCancel}
                      className={`w-full py-2 border font-medium rounded-lg transition ${
                        disableCancel ? 'border-gray-200 text-gray-400 cursor-not-allowed' : 'border-red-200 text-red-600 hover:bg-red-50'
                      }`}
                    >
                      Cancel Booking
                    </button>
                    {disableCancel && (
                      <div className="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 w-max max-w-xs px-3 py-1 bg-gray-800 text-white text-xs rounded opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none z-10">
                        Cannot cancel completed or cancelled booking
                      </div>
                    )}
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      ) : (
        <div className="text-center py-12 bg-white rounded-2xl shadow-sm">
          <p className="text-gray-500 mb-4">You have no bookings yet.</p>
          <Link to="/" className="text-blue-600 font-medium hover:underline">Explore Services</Link>
        </div>
      )}

      {/* Cancel Modal */}
      {cancelModal.isOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50 p-4">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 relative">
            <h3 className="text-2xl font-bold text-gray-900 mb-2">Cancel Booking</h3>
            <p className="text-gray-600 mb-6">Are you sure you want to cancel this booking?</p>
            
            <div className="bg-gray-50 rounded-xl p-4 mb-6 text-sm">
              <p className="font-semibold text-gray-900 mb-1">{cancelModal.booking.title}</p>
              <p className="text-gray-500 mb-1">Date: {new Date(cancelModal.booking.date).toLocaleDateString()}</p>
              <p className="text-gray-500">Total Price: <span className="font-semibold">${Number(cancelModal.booking.total_price).toFixed(2)}</span></p>
            </div>

            <div className="flex gap-3 justify-end">
              <button
                onClick={closeCancelModal}
                className="px-5 py-2 text-gray-600 font-medium rounded-lg hover:bg-gray-100 transition"
              >
                Close
              </button>
              <button
                onClick={confirmCancel}
                className="px-5 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition shadow-sm"
              >
                Confirm Cancel
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
