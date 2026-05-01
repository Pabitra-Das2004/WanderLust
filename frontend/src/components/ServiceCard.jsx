import { useNavigate } from 'react-router-dom';
import { MapPin, IndianRupee, Heart } from 'lucide-react';

export default function ServiceCard({ service }) {
  const navigate = useNavigate();
  
  return (
    <div 
      onClick={() => navigate(`/services/${service.id}`)}
      className="bg-white rounded-2xl shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden group cursor-pointer flex flex-col h-full border border-gray-100"
    >
      <div className="relative h-56 overflow-hidden bg-gray-200 shrink-0">
        <img
          src={service.image || `https://source.unsplash.com/800x600/?${service.type},travel`}
          alt={service.title}
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
          onError={(e) => { e.target.src = 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&q=80&w=800'; }}
        />
        
        <div className="absolute top-4 left-4 bg-white/95 backdrop-blur-sm px-3 py-1.5 rounded-full text-xs font-bold text-gray-900 shadow-md">
          Guest favourite
        </div>

        <div className="absolute top-4 right-4 p-1.5 text-white drop-shadow-md hover:scale-110 transition">
          <Heart className="h-6 w-6" />
        </div>
      </div>
      
      <div className="p-4 flex flex-col flex-1">
        <div className="flex justify-between items-start mb-1">
          <h3 className="text-base font-bold text-gray-900 truncate pr-2">
            {service.location || (service.from_place && service.to_place ? `${service.from_place} to ${service.to_place}` : '')}
          </h3>
          <div className="flex items-center text-sm font-semibold">
            ★ {Number(Math.random() * (5 - 4.5) + 4.5).toFixed(2)}
          </div>
        </div>
        
        <p className="text-gray-500 text-sm truncate">{service.title}</p>
        <p className="text-gray-500 text-sm mb-3 capitalize">{service.type}</p>
        
        <div className="mt-auto">
          <div className="flex items-center text-gray-900">
            <span className="font-bold text-base flex items-center"><IndianRupee className="h-4 w-4 mr-0.5" />{Number(service.price).toFixed(2)}</span>
            <span className="text-gray-500 text-sm ml-1">total</span>
          </div>
        </div>
      </div>
    </div>
  );
}
