import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { PlaneTakeoff, LogOut, User } from 'lucide-react';

export default function Navbar() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <nav className="bg-white shadow-md sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between h-16 items-center">
          <Link to="/" className="flex items-center space-x-2">
            <PlaneTakeoff className="h-8 w-8 text-blue-600" />
            <span className="text-xl font-bold text-gray-900">Wanderlust</span>
          </Link>
          
          <div className="flex items-center space-x-4">
            {user ? (
              <>
                {user.role === 'admin' && (
                  <Link to="/admin" className="text-gray-600 hover:text-blue-600 font-medium">
                    Admin
                  </Link>
                )}
                {user.role === 'creator' && (
                  <Link to="/creator" className="text-gray-600 hover:text-blue-600 font-medium">
                    Creator Panel
                  </Link>
                )}
                <Link to="/dashboard" className="text-gray-600 hover:text-blue-600 font-medium">
                  Dashboard
                </Link>
                <Link to="/profile" className="flex items-center space-x-2 text-gray-600 hover:text-blue-600 border-l pl-4 hidden sm:flex transition">
                  <User className="h-5 w-5" />
                  <span className="font-medium">{user.name}</span>
                </Link>
                <button
                  onClick={handleLogout}
                  className="flex items-center space-x-1 text-red-600 hover:text-red-800 font-medium transition"
                >
                  <LogOut className="h-5 w-5" />
                  <span className="hidden sm:inline">Logout</span>
                </button>
              </>
            ) : (
              <>
                <Link to="/login" className="text-gray-600 hover:text-blue-600 font-medium">
                  Login
                </Link>
                <Link
                  to="/register"
                  className="bg-blue-600 text-white px-4 py-2 rounded-lg font-medium hover:bg-blue-700 transition shadow"
                >
                  Register
                </Link>
              </>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}
