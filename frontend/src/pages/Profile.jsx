import { useState, useEffect } from 'react';
import api from '../api/axios';
import { toast } from 'react-hot-toast';
import { User, Mail, Calendar, Shield, Save } from 'lucide-react';
import { useAuth } from '../context/AuthContext';

export default function Profile() {
  const { user: authUser } = useAuth();
  const [profile, setProfile] = useState(null);
  const [isEditing, setIsEditing] = useState(false);
  const [formData, setFormData] = useState({ name: '', password: '' });

  useEffect(() => {
    fetchProfile();
  }, []);

  const fetchProfile = async () => {
    try {
      const res = await api.get('/auth/profile');
      setProfile(res.data);
      setFormData({ name: res.data.name, password: '' });
    } catch (err) {
      toast.error('Failed to load profile');
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const updateData = {};
      if (formData.name !== profile.name) updateData.name = formData.name;
      if (formData.password) updateData.password = formData.password;
      
      if (Object.keys(updateData).length === 0) {
        setIsEditing(false);
        return;
      }
      
      const res = await api.put('/auth/profile', updateData);
      setProfile(res.data);
      setFormData({ name: res.data.name, password: '' });
      setIsEditing(false);
      toast.success('Profile updated successfully');
    } catch (err) {
      toast.error('Failed to update profile');
    }
  };

  if (!profile) return <div className="text-center py-12">Loading...</div>;

  return (
    <div className="max-w-2xl mx-auto mt-8">
      <h2 className="text-3xl font-bold text-gray-900 mb-8">My Profile</h2>
      
      <div className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
        <div className="p-8">
          <div className="flex items-center space-x-6 mb-8 border-b border-gray-100 pb-8">
            <div className="bg-blue-100 p-4 rounded-full">
              <User className="h-12 w-12 text-blue-600" />
            </div>
            <div>
              <h3 className="text-2xl font-bold text-gray-900">{profile.name}</h3>
              <p className="text-gray-500 capitalize">{profile.role}</p>
            </div>
          </div>

          {isEditing ? (
            <form onSubmit={handleSubmit} className="space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <User className="h-5 w-5 text-gray-400" />
                  </div>
                  <input
                    type="text"
                    required
                    value={formData.name}
                    onChange={(e) => setFormData({...formData, name: e.target.value})}
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                  />
                </div>
              </div>
              
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">New Password (optional)</label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <Shield className="h-5 w-5 text-gray-400" />
                  </div>
                  <input
                    type="password"
                    placeholder="Leave blank to keep current"
                    value={formData.password}
                    onChange={(e) => setFormData({...formData, password: e.target.value})}
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500"
                  />
                </div>
              </div>
              
              <div className="flex gap-4 pt-4">
                <button
                  type="submit"
                  className="flex-1 flex justify-center items-center py-2 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition"
                >
                  <Save className="h-4 w-4 mr-2" />
                  Save Changes
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setIsEditing(false);
                    setFormData({ name: profile.name, password: '' });
                  }}
                  className="flex-1 py-2 px-4 border border-gray-300 rounded-lg shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none transition"
                >
                  Cancel
                </button>
              </div>
            </form>
          ) : (
            <div className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-gray-50 p-4 rounded-xl border border-gray-100">
                  <div className="flex items-center text-gray-500 mb-1">
                    <Mail className="h-4 w-4 mr-2" />
                    <span className="text-sm font-medium">Email</span>
                  </div>
                  <p className="text-gray-900 font-medium pl-6">{profile.email}</p>
                </div>
                
                <div className="bg-gray-50 p-4 rounded-xl border border-gray-100">
                  <div className="flex items-center text-gray-500 mb-1">
                    <Shield className="h-4 w-4 mr-2" />
                    <span className="text-sm font-medium">Role</span>
                  </div>
                  <p className="text-gray-900 font-medium pl-6 capitalize">{profile.role}</p>
                </div>
                
                <div className="bg-gray-50 p-4 rounded-xl border border-gray-100 md:col-span-2">
                  <div className="flex items-center text-gray-500 mb-1">
                    <Calendar className="h-4 w-4 mr-2" />
                    <span className="text-sm font-medium">Member Since</span>
                  </div>
                  <p className="text-gray-900 font-medium pl-6">
                    {new Date(profile.created_at).toLocaleDateString(undefined, {
                      year: 'numeric',
                      month: 'long',
                      day: 'numeric'
                    })}
                  </p>
                </div>
              </div>
              
              <div className="pt-6 border-t border-gray-100">
                <button
                  onClick={() => setIsEditing(true)}
                  className="w-full py-2 px-4 border border-gray-300 rounded-lg shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition"
                >
                  Edit Profile
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
