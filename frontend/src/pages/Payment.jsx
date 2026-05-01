import { useEffect } from 'react';
import { useParams, useLocation, useNavigate } from 'react-router-dom';
import api from '../api/axios';
import { toast } from 'react-hot-toast';
import { CreditCard, AlertCircle } from 'lucide-react';

export default function Payment() {
  const { id } = useParams();
  const location = useLocation();
  const navigate = useNavigate();
  const amount = location.state?.amount;

  useEffect(() => {
    if (!amount) {
      navigate('/dashboard');
    }
  }, [amount, navigate]);

  const handlePayment = async () => {
    try {
      // 1. Create order
      const { data: order } = await api.post('/payment/create-order', {
        amount,
        booking_id: id
      });

      // 2. Open Razorpay Checkout
      const options = {
        key: import.meta.env.VITE_RAZORPAY_KEY || 'rzp_test_xxxxxx',
        amount: order.amount,
        currency: order.currency,
        name: "Wanderlust Escapes",
        description: "Booking Payment",
        order_id: order.id,
        handler: async function (response) {
          try {
            // 3. Verify payment
            await api.post('/payment/verify', {
              ...response,
              booking_id: id,
              amount
            });
            toast.success('Payment successful!');
            window.location.href = '/dashboard';
          } catch (err) {
            toast.error('Payment verification failed');
          }
        },
        theme: {
          color: "#2563eb"
        }
      };
      
      const rzp = new window.Razorpay(options);
      rzp.open();

      // 4. Fallback timeout to auto-trigger success for Demo
      setTimeout(async () => {
        try {
          await api.post('/payment/demo-upi-success', {
            booking_id: id,
            amount
          });
          toast.success('Payment Successful! (Demo Auto-Success)');
          // Redirect via window.location to ensure the Razorpay iframe is destroyed
          window.location.href = '/dashboard';
        } catch (err) {
          console.error("Auto success failed", err);
        }
      }, 10000);

    } catch (err) {
      toast.error('Could not initiate payment');
    }
  };

  if (!amount) return null;

  return (
    <div className="max-w-md mx-auto bg-white p-8 rounded-2xl shadow-sm text-center mt-12">
      <div className="bg-blue-50 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
        <CreditCard className="h-8 w-8 text-blue-600" />
      </div>
      <h2 className="text-2xl font-bold mb-2">Complete Your Payment</h2>
      <p className="text-gray-600 mb-6">You are about to pay <span className="font-bold text-gray-900">${Number(amount).toFixed(2)}</span> for your booking.</p>
      
      <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 mb-8 flex items-start text-left">
        <AlertCircle className="h-5 w-5 text-yellow-600 mr-3 flex-shrink-0 mt-0.5" />
        <p className="text-sm text-yellow-800">
          <strong>Note:</strong> UPI auto-success is simulated for demo purposes. Real Razorpay requires user confirmation. The payment will automatically complete 10 seconds after opening the popup.
        </p>
      </div>

      <button
        onClick={handlePayment}
        className="w-full py-3 bg-blue-600 text-white font-bold rounded-lg hover:bg-blue-700 transition"
      >
        Pay with Razorpay
      </button>
    </div>
  );
}
