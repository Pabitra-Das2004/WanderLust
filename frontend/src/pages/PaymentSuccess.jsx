import { Link } from 'react-router-dom';
import { CheckCircle } from 'lucide-react';

export default function PaymentSuccess() {
  return (
    <div className="max-w-md mx-auto bg-white p-8 rounded-2xl shadow-sm text-center mt-12">
      <div className="bg-green-50 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
        <CheckCircle className="h-8 w-8 text-green-600" />
      </div>
      <h2 className="text-2xl font-bold mb-2">Payment Successful!</h2>
      <p className="text-gray-600 mb-6">Your booking has been confirmed.</p>
      
      <Link
        to="/dashboard"
        className="block w-full py-3 bg-blue-600 text-white font-bold rounded-lg hover:bg-blue-700 transition"
      >
        Go to Dashboard
      </Link>
    </div>
  );
}
