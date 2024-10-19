import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practices/models/notification.dart';

class Notification_page extends StatefulWidget {
  @override
  _Notification_pageState createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  late Future<List<Notify>> notifications;

  Future<List<Notify>> fetchNotifications() async {
    final dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Notify.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  @override
  void initState() {
    super.initState();
    notifications = fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: FutureBuilder<List<Notify>>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No notifications found.'));
          }

          final notificationList = snapshot.data!;

          return ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index) {
              final notify = notificationList[index];
              return ListTile(
                title: Text(notify.title ?? ''),
                subtitle: Text('\$${notify.price}'),
                leading: Image.network(notify.image ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
