
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practices/view/example_screens/image_slider.dart';

class VerifyOtpPage extends StatefulWidget {
  final String mobileNumber;

  const VerifyOtpPage({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Verify OTP")),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 40,
                    child: TextFormField(
                      controller: _otpControllers[index],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "",
                      ),
                      keyboardType: TextInputType.number,
                      // maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter OTP digit";
                        }
                        return null;
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String otp = _otpControllers.map((controller) => controller.text).join();
                    await verifyOtp(context, widget.mobileNumber, otp);
                  }
                },
                child: Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(BuildContext context, String mobileNumber, String otp) async {
    final response = await http.post(
      Uri.parse('https://yourapi.com/verify-otp'), 
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'mobile_number': mobileNumber,
        'otp': otp,
      }),
    );

    if (response.statusCode == 200) {
      print("OTP verified for $mobileNumber");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ImagePage()), 
      );
    } else {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] ?? 'Failed to verify OTP';
      print(errorMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}
