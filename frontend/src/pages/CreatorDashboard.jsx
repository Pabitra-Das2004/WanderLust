import { useState, useEffect } from 'react';
import api from '../api/axios';
import { toast } from 'react-hot-toast';
import { Package, Calendar, DollarSign, Trash2, Plus, BarChart as BarChartIcon } from 'lucide-react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

export default function CreatorDashboard() {
  const [activeTab, setActiveTab] = useState('summary');
  const [summary, setSummary] = useState({ total_services: 0, total_bookings: 0, total_revenue: 0 });
  const [services, setServices] = useState([]);
  const [bookings, setBookings] = useState([]);
  
  // New service form state
  const [showAddService, setShowAddService] = useState(false);
  const [newService, setNewService] = useState({ 
    title: '', type: 'package', price: '', description: '', image: '',
    location: '', start_date: '', end_date: '',
    from_place: '', to_place: '', travel_date: ''
  });

  const fetchData = async () => {
    try {
      const [sumRes, servRes, bookRes] = await Promise.all([
        api.get('/creator/summary'),
        api.get('/creator/services'),
        api.get('/creator/bookings')
      ]);
      setSummary(sumRes.data);
      setServices(servRes.data);
      setBookings(bookRes.data);
    } catch (err) {
      console.error('Failed to fetch creator data', err);
      toast.error('Failed to fetch dashboard data');
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleDeleteService = async (id) => {
    if (!window.confirm('Are you sure you want to delete this service?')) return;
    try {
      await api.delete(`/services/${id}`);
      toast.success('Service deleted successfully');
      fetchData();
    } catch (err) {
      toast.error('Failed to delete service');
    }
  };

  const handleAddService = async (e) => {
    e.preventDefault();
    try {
      await api.post('/services', newService);
      toast.success('Service added successfully');
      setShowAddService(false);
      setNewService({ 
        title: '', type: 'package', price: '', description: '', image: '',
        location: '', start_date: '', end_date: '',
        from_place: '', to_place: '', travel_date: ''
      });
      fetchData();
    } catch (err) {
      toast.error('Failed to add service');
    }
  };

  const tabs = [
    { id: 'summary', name: 'Dashboard', icon: <BarChartIcon className="w-5 h-5" /> },
    { id: 'services', name: 'My Services', icon: <Package className="w-5 h-5" /> },
    { id: 'bookings', name: 'Bookings', icon: <Calendar className="w-5 h-5" /> }
  ];

  const getChartData = () => {
    const dataMap = {};
    services.forEach(s => {
      dataMap[s.title] = { name: s.title, buyers: 0, revenue: 0 };
    });
    bookings.forEach(b => {
      if (b.status !== 'CANCELLED') {
        if (!dataMap[b.service_title]) {
          dataMap[b.service_title] = { name: b.service_title, buyers: 0, revenue: 0 };
        }
        dataMap[b.service_title].buyers += 1;
        dataMap[b.service_title].revenue += Number(b.total_price);
      }
    });
    return Object.values(dataMap);
  };

  return (
    <div className="min-h-screen bg-gray-50 -mt-8 pt-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-12">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Creator Studio</h1>
        
        {/* Navigation Tabs */}
        <div className="flex space-x-1 bg-white p-1 rounded-xl shadow-sm mb-8 overflow-x-auto">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`flex items-center space-x-2 px-6 py-3 rounded-lg text-sm font-medium transition-all whitespace-nowrap ${
                activeTab === tab.id
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'text-gray-500 hover:text-gray-900 hover:bg-gray-100'
              }`}
            >
              {tab.icon}
              <span>{tab.name}</span>
            </button>
          ))}
        </div>

        {/* Content Area */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 overflow-hidden">
          
          {/* Dashboard Summary Tab */}
          {activeTab === 'summary' && (
            <div className="space-y-8">
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="bg-green-50 p-6 rounded-xl border border-green-100 flex items-center space-x-4">
                  <div className="p-3 bg-green-500 text-white rounded-lg"><Package className="w-6 h-6" /></div>
                  <div>
                    <p className="text-sm font-medium text-green-600">Active Services</p>
                    <p className="text-2xl font-bold text-gray-900">{summary.total_services}</p>
                  </div>
                </div>
                <div className="bg-purple-50 p-6 rounded-xl border border-purple-100 flex items-center space-x-4">
                  <div className="p-3 bg-purple-500 text-white rounded-lg"><Calendar className="w-6 h-6" /></div>
                  <div>
                    <p className="text-sm font-medium text-purple-600">Total Bookings</p>
                    <p className="text-2xl font-bold text-gray-900">{summary.total_bookings}</p>
                  </div>
                </div>
                <div className="bg-yellow-50 p-6 rounded-xl border border-yellow-100 flex items-center space-x-4">
                  <div className="p-3 bg-yellow-500 text-white rounded-lg"><DollarSign className="w-6 h-6" /></div>
                  <div>
                    <p className="text-sm font-medium text-yellow-600">My Revenue</p>
                    <p className="text-2xl font-bold text-gray-900">${Number(summary.total_revenue).toFixed(2)}</p>
                  </div>
                </div>
              </div>

              {/* Analytics Graphs */}
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 pt-8 border-t border-gray-100">
                <div className="bg-white border border-gray-100 rounded-xl p-6 shadow-sm">
                  <h3 className="text-lg font-bold text-gray-900 mb-6">Service Popularity (Buyers)</h3>
                  <div className="h-72">
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={getChartData()}>
                        <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E5E7EB" />
                        <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{fill: '#6B7280', fontSize: 12}} />
                        <YAxis axisLine={false} tickLine={false} tick={{fill: '#6B7280', fontSize: 12}} />
                        <Tooltip cursor={{fill: '#F3F4F6'}} contentStyle={{borderRadius: '8px', border: 'none', boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)'}} />
                        <Bar dataKey="buyers" fill="#8B5CF6" radius={[4, 4, 0, 0]} />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
                
                <div className="bg-white border border-gray-100 rounded-xl p-6 shadow-sm">
                  <h3 className="text-lg font-bold text-gray-900 mb-6">Revenue per Service</h3>
                  <div className="h-72">
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={getChartData()}>
                        <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E5E7EB" />
                        <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{fill: '#6B7280', fontSize: 12}} />
                        <YAxis axisLine={false} tickLine={false} tick={{fill: '#6B7280', fontSize: 12}} />
                        <Tooltip cursor={{fill: '#F3F4F6'}} contentStyle={{borderRadius: '8px', border: 'none', boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)'}} />
                        <Bar dataKey="revenue" fill="#10B981" radius={[4, 4, 0, 0]} />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Services Tab */}
          {activeTab === 'services' && (
            <div>
              <div className="flex justify-between items-center mb-6">
                <h2 className="text-lg font-semibold text-gray-900">Manage My Services</h2>
                <button 
                  onClick={() => setShowAddService(!showAddService)}
                  className="flex items-center space-x-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition"
                >
                  <Plus className="w-4 h-4" />
                  <span>Add Service</span>
                </button>
              </div>

              {showAddService && (
                <form onSubmit={handleAddService} className="bg-gray-50 p-6 rounded-xl border border-gray-200 mb-8 grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Title</label>
                    <input required type="text" value={newService.title} onChange={e => setNewService({...newService, title: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Type</label>
                    <select value={newService.type} onChange={e => setNewService({...newService, type: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none">
                      <option value="package">Package</option>
                      <option value="hotel">Hotel</option>
                      <option value="flight">Flight</option>
                      <option value="train">Train</option>
                    </select>
                  </div>
                  {(newService.type === 'package' || newService.type === 'hotel') ? (
                    <>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Location</label>
                        <input required type="text" value={newService.location} onChange={e => setNewService({...newService, location: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
                        <input required type="date" value={newService.start_date} onChange={e => setNewService({...newService, start_date: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">End Date</label>
                        <input required type="date" min={newService.start_date} value={newService.end_date} onChange={e => setNewService({...newService, end_date: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                      </div>
                    </>
                  ) : (
                    <>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">From</label>
                        <input required type="text" value={newService.from_place} onChange={e => setNewService({...newService, from_place: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">To</label>
                        <input required type="text" value={newService.to_place} onChange={e => setNewService({...newService, to_place: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Travel Date</label>
                        <input required type="date" value={newService.travel_date} onChange={e => setNewService({...newService, travel_date: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                      </div>
                    </>
                  )}
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Price</label>
                    <input required type="number" step="0.01" value={newService.price} onChange={e => setNewService({...newService, price: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" />
                  </div>
                  <div className="md:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Image URL</label>
                    <input required type="text" value={newService.image} onChange={e => setNewService({...newService, image: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" placeholder="https://example.com/image.jpg" />
                  </div>
                  <div className="md:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Description</label>
                    <textarea required value={newService.description} onChange={e => setNewService({...newService, description: e.target.value})} className="w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none" rows="3"></textarea>
                  </div>
                  <div className="md:col-span-2 flex justify-end">
                    <button type="submit" className="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 transition font-medium">Save Service</button>
                  </div>
                </form>
              )}

              <div className="overflow-x-auto">
                <table className="w-full text-left border-collapse">
                  <thead>
                    <tr className="bg-gray-50 border-b border-gray-100 text-gray-500 text-sm">
                      <th className="p-4 font-medium">ID</th>
                      <th className="p-4 font-medium">Service</th>
                      <th className="p-4 font-medium">Location / Route</th>
                      <th className="p-4 font-medium">Price</th>
                      <th className="p-4 font-medium text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {services.map((s) => (
                      <tr key={s.id} className="hover:bg-gray-50 transition">
                        <td className="p-4 text-sm text-gray-500">{s.id}</td>
                        <td className="p-4">
                          <div className="flex items-center space-x-3">
                            {s.image && <img src={s.image} alt={s.title} className="w-10 h-10 rounded-lg object-cover" />}
                            <div>
                              <p className="font-medium text-gray-900">{s.title}</p>
                              <p className="text-xs text-gray-500 capitalize">{s.type}</p>
                            </div>
                          </div>
                        </td>
                        <td className="p-4 text-gray-600">
                          {s.location || (s.from_place && s.to_place ? `${s.from_place} to ${s.to_place}` : '-')}
                        </td>
                        <td className="p-4 font-medium text-gray-900">${Number(s.price).toFixed(2)}</td>
                        <td className="p-4 text-right">
                          <button onClick={() => handleDeleteService(s.id)} className="p-2 text-red-500 hover:bg-red-50 rounded-lg transition">
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {/* Bookings Tab */}
          {activeTab === 'bookings' && (
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-gray-50 border-b border-gray-100 text-gray-500 text-sm">
                    <th className="p-4 font-medium">ID</th>
                    <th className="p-4 font-medium">User</th>
                    <th className="p-4 font-medium">Service</th>
                    <th className="p-4 font-medium">Status</th>
                    <th className="p-4 font-medium">Amount</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {bookings.map((b) => (
                    <tr key={b.id} className="hover:bg-gray-50 transition">
                      <td className="p-4 text-sm text-gray-500">{b.id}</td>
                      <td className="p-4">
                        <p className="font-medium text-gray-900">{b.user_name}</p>
                        <p className="text-xs text-gray-500">{b.email}</p>
                      </td>
                      <td className="p-4 text-gray-600">{b.service_title}</td>
                      <td className="p-4">
                        <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                          b.status === 'CONFIRMED' ? 'bg-green-100 text-green-700' :
                          b.status === 'CANCELLED' ? 'bg-red-100 text-red-700' :
                          'bg-yellow-100 text-yellow-700'
                        }`}>
                          {b.status}
                        </span>
                      </td>
                      <td className="p-4 font-medium text-gray-900">${Number(b.total_price).toFixed(2)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
