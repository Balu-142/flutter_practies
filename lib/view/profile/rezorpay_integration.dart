import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RezorpayIntegration extends StatefulWidget {
  const RezorpayIntegration({super.key});


  @override
  State<RezorpayIntegration> createState() => _RezorpayIntegrationState();
}

class _RezorpayIntegrationState extends State<RezorpayIntegration> {
  @override

  Razorpay _razorpay = Razorpay();

  Widget build(BuildContext context) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("payment")),),
      body: ListView(

        children: [
          ElevatedButton(onPressed: (){

            var options = {
              'key': '<YOUR_KEY_HERE>',
              'amount': 10,
              'name': 'Balu pamba',
              'description': 'Fine T-Shirt',
              'prefill': {
                'contact': '6302125421',
                'email': 'test@razorpay.com'
              }
            };

            _razorpay.open(options);

          }, child: Text("Pay Now"))
        ],
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(msg: "Payment succeeds");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(msg: "Payment Fails");

  }

void dispose(){
    super.dispose();
    _razorpay.clear();
}
}
