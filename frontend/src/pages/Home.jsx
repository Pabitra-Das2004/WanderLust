import { useState, useEffect, useRef } from 'react';
import api from '../api/axios';
import ServiceCard from '../components/ServiceCard';
import { Search, Filter, ChevronLeft, ChevronRight } from 'lucide-react';

const ServiceSection = ({ title, services }) => {
  const scrollRef = useRef(null);

  const scroll = (direction) => {
    if (scrollRef.current) {
      const { scrollLeft, clientWidth } = scrollRef.current;
      const scrollTo = direction === 'left' ? scrollLeft - clientWidth : scrollLeft + clientWidth;
      scrollRef.current.scrollTo({ left: scrollTo, behavior: 'smooth' });
    }
  };

  if (!services || services.length === 0) return null;

  return (
    <div className="relative group mb-12">
      <div className="flex justify-between items-center mb-6">
        <h2 className="text-2xl font-bold text-gray-900">{title}</h2>
        <div className="flex gap-2">
          <button 
            onClick={() => scroll('left')} 
            className="p-2 rounded-full bg-white border border-gray-200 shadow-sm hover:bg-gray-50 opacity-0 group-hover:opacity-100 transition-opacity hidden md:block"
          >
            <ChevronLeft className="h-5 w-5 text-gray-600" />
          </button>
          <button 
            onClick={() => scroll('right')} 
            className="p-2 rounded-full bg-white border border-gray-200 shadow-sm hover:bg-gray-50 opacity-0 group-hover:opacity-100 transition-opacity hidden md:block"
          >
            <ChevronRight className="h-5 w-5 text-gray-600" />
          </button>
        </div>
      </div>

      <div 
        ref={scrollRef}
        className="flex gap-6 overflow-x-auto pb-6 snap-x snap-mandatory hide-scrollbar"
        style={{ scrollbarWidth: 'none', msOverflowStyle: 'none' }}
      >
        {services.map((service) => (
          <div key={service.id} className="snap-start shrink-0 w-[85vw] sm:w-[calc(50%-12px)] md:w-[calc(33.333%-16px)] lg:w-[calc(25%-18px)] xl:w-[calc(20%-19.2px)]">
            <ServiceCard service={service} />
          </div>
        ))}
      </div>
      
      <style dangerouslySetInnerHTML={{__html: `
        .hide-scrollbar::-webkit-scrollbar {
          display: none;
        }
      `}} />
    </div>
  );
};

export default function Home() {
  const [hotels, setHotels] = useState([]);
  const [flights, setFlights] = useState([]);
  const [packages, setPackages] = useState([]);
  const [trains, setTrains] = useState([]);
  
  const [searchQuery, setSearchQuery] = useState('');
  const [filterType, setFilterType] = useState('all');
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  const fetchServices = async () => {
    try {
      const typeParam = filterType === 'all' ? '' : filterType;
      const res = await api.get(`/services?search=${encodeURIComponent(searchQuery)}&type=${typeParam}`);
      const data = res.data;
      setHotels(data.filter(s => s.type === 'hotel'));
      setFlights(data.filter(s => s.type === 'flight'));
      setPackages(data.filter(s => s.type === 'package'));
      setTrains(data.filter(s => s.type === 'train'));
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    const delayDebounceFn = setTimeout(() => {
      fetchServices();
    }, 300);
    return () => clearTimeout(delayDebounceFn);
  }, [searchQuery, filterType]);

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    fetchServices();
  };

  return (
    <div className="space-y-8 pb-12">
      {/* Hero Section */}
      <div className="relative rounded-3xl overflow-hidden bg-blue-600 text-white p-12 text-center shadow-lg">
        <div className="absolute inset-0 opacity-20 bg-[url('https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&q=80')] bg-cover bg-center"></div>
        <div className="relative z-10 space-y-4">
          <h1 className="text-4xl md:text-6xl font-extrabold tracking-tight">Discover Your Next Adventure</h1>
          <p className="text-lg md:text-xl text-blue-100 max-w-2xl mx-auto">
            Book hotels, flights, and exclusive travel packages with ease.
          </p>
        </div>
      </div>

      {/* Search & Filter Bar */}
      <form onSubmit={handleSearchSubmit} className="bg-white p-4 rounded-2xl shadow-sm flex flex-col md:flex-row gap-4 items-center">
        <div className="flex-1 w-full flex items-center bg-gray-50 px-4 py-2 rounded-xl border border-gray-100 focus-within:ring-2 focus-within:ring-blue-500 transition">
          <Search className="h-5 w-5 text-gray-400 mr-2" />
          <input
            type="text"
            placeholder="Search by title, city, destination..."
            className="bg-transparent w-full focus:outline-none text-gray-900"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </div>
        <div className="relative w-full md:w-64">
          <div 
            className="flex items-center justify-between bg-gray-50 px-4 py-3 rounded-xl border border-gray-100 cursor-pointer hover:border-blue-300 transition shadow-sm"
            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
          >
            <div className="flex items-center">
              <Filter className="h-5 w-5 text-blue-500 mr-2" />
              <span className="text-gray-900 font-medium capitalize">
                {filterType === 'all' ? 'All Categories' : filterType + 's'}
              </span>
            </div>
            <svg className={`h-5 w-5 text-gray-400 transition-transform ${isDropdownOpen ? 'rotate-180' : ''}`} fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
          </div>
          
          {isDropdownOpen && (
            <>
              <div className="fixed inset-0 z-40" onClick={() => setIsDropdownOpen(false)}></div>
              <div className="absolute z-50 mt-2 w-full bg-white border border-gray-100 rounded-xl shadow-xl py-2 overflow-hidden transform opacity-100 scale-100 transition-all origin-top">
                {['all', 'hotel', 'flight', 'train', 'package'].map(type => (
                  <div 
                    key={type}
                    className={`px-4 py-3 cursor-pointer hover:bg-blue-50 transition capitalize flex items-center ${filterType === type ? 'bg-blue-50/50 text-blue-600 font-bold border-l-4 border-blue-600' : 'text-gray-600 border-l-4 border-transparent'}`}
                    onClick={() => {
                      setFilterType(type);
                      setIsDropdownOpen(false);
                    }}
                  >
                    {type === 'all' ? 'All Categories' : type + 's'}
                  </div>
                ))}
              </div>
            </>
          )}
        </div>
        <button
          type="submit"
          className="w-full md:w-auto px-8 py-3 bg-blue-600 text-white font-medium rounded-xl hover:bg-blue-700 transition shadow-sm"
        >
          Search
        </button>
      </form>

      {/* Service Grids */}
      <div className="pt-4">
        {hotels.length === 0 && flights.length === 0 && packages.length === 0 && trains.length === 0 ? (
          <div className="text-center py-12 text-gray-500">
            No services found matching your criteria.
          </div>
        ) : (
          <>
            <ServiceSection title="Popular Hotels" services={hotels} />
            <ServiceSection title="Popular Flights" services={flights} />
            <ServiceSection title="Popular Packages" services={packages} />
            <ServiceSection title="Popular Trains" services={trains} />
          </>
        )}
      </div>
    </div>
  );
}
