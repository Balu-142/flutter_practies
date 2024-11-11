import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayIntegration extends StatefulWidget {
  const RazorpayIntegration({Key? key}) : super(key: key);

  @override
  State<RazorpayIntegration> createState() => _RazorpayIntegrationState();
}

class _RazorpayIntegrationState extends State<RazorpayIntegration> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Payment")),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_jvU6YMYCBU1K7M',
                    // 'rzp_test_GcZZFDPP0jHtC4', // Replace with your actual key
                'amount': 10, // Amount in paise
                'name': 'Balu Pamba',
                'description': 'First send',
                'prefill': {
                  'contact': '6302125421',
                  'email': 'balu@gmail.com',
                },
              };

              _razorpay.open(options);
            },
            child: Text("Pay Now"),
          ),
        ],
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    Fluttertoast.showToast(msg: "Payment Successful: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    Fluttertoast.showToast(msg: "Payment Failed: ${response.message}");
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
