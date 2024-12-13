import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/customer_contact.dart';

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  late Future<List<Service>> services;

  @override
  void initState() {
    super.initState();
    services = fetchServices();
  }

  Future<List<Service>> fetchServices() async {
    final dio = Dio();
    final response = await dio.get('http://localhost/yii-basic/basic/web/v1/contact-form/'); 

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Service.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: FutureBuilder<List<Service>>(
        future: services,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No services found'));
          }

          final serviceList = snapshot.data!;

          return ListView.builder(
            itemCount: serviceList.length,
            itemBuilder: (context, index) {
              return serviceCard(serviceList[index]);
            },
          );
        },
      ),
    );
  }

  Widget serviceCard(Service service) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: ${service.serviceName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Customer: ${service.customerName}'),
            Text('Mobile: ${service.customerMobile}'),
            Text('Email: ${service.customerEmail}'),
            Text('Note: ${service.customerNote}'),
            Text('Login Date: ${service.customerLoginDate.toLocal()}'),
          ],
        ),
      ),
    );
  }
}
