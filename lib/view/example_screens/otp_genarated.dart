import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'package:practices/view/example_screens/image_slider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _mobileController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("OTP Page")),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _mobileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mobile Number",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a valid mobile number";
                }
                if (value.length != 10) {
                  return "Please enter 10 digits";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await sendOtp(_mobileController.text);
                }
              },
              child: Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendOtp(String mobileNumber) async {
    final response = await http.post(
      Uri.parse('https://yourapi.com/send-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'mobile_number': mobileNumber,
      }),
    );

    if (response.statusCode == 200) {
      print("OTP sent to $mobileNumber");
    } else {
      print("Failed to send OTP");
    }
  }
}
