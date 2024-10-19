import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practices/models/login_model.dart';

class LoginList extends StatefulWidget {
  const LoginList({super.key});

  @override
  State<LoginList> createState() => _LoginListState();
}

class _LoginListState extends State<LoginList> {
  late Future<List<Welcome>> welcome;

  @override
  void initState() {
    super.initState();
    welcome = fetchWelcome();
  }

  Future<List<Welcome>> fetchWelcome() async {
    final dio = Dio();
    final response = await dio.get('http://localhost/yii-basic/basic/web/v1/login');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Welcome.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login List'),
      ),
      body: FutureBuilder<List<Welcome>>(
        future: welcome,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            List<Welcome> welcomeList = snapshot.data!;
            return ListView.builder(
              itemCount: welcomeList.length,
              itemBuilder: (context, index) {
                final welcomeItem = welcomeList[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${welcomeItem.name}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Mobile: ${welcomeItem.mobile}'),
                        Text('Email: ${welcomeItem.email}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
