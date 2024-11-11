import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practices/models/login_model.dart';

class Login_page_data extends StatefulWidget {
  const Login_page_data({super.key});

  @override
  State<Login_page_data> createState() => _Login_page_dataState();
}

class _Login_page_dataState extends State<Login_page_data> {

  late Future<List<Welcome>>  welcome;

  @override
  void initState() {
    super.initState();
    welcome = fetchWelcome();
  }

  Future<List<Welcome>> fetchWelcome() async{
    final dio = Dio();
    final response = await dio.get('https://gorest.co.in/public/v2/users');
    if(response.statusCode == 200){
      List<dynamic> data =response.data;
      return data.map((item) => Welcome.fromJson(item)).toList();
    } else{
      throw Exception('Field to fetch data');
    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login data"),
      ),
      body: FutureBuilder<List<Welcome>>(
        future: welcome,
        builder: (context , snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          else{
            List<Welcome> welcomeList = snapshot.data!;
            return ListView.builder(
              itemCount: welcomeList.length,
                itemBuilder: (context,index){
                  final welcomeitem = welcomeList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),// def b/w card height
                    child: Card(
                      color: Colors.cyan,
                      // elevation: 7,
                                 child: Container(
                                   width: MediaQuery.of(context).size.width * 0.2, // Set card width (20% of screen width)
                                   padding: const EdgeInsets.all(16.0), // padding inside the card
                                   child: Column(
                                     children: [
                                       Text('name : ${welcomeitem.name}',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                                       Text('Emaile : ${welcomeitem.email}'),
                                       Text('Mobile : ${welcomeitem.mobile}')
                                     ],
                                   ),
                                 ),
                              ),
                  );

                }
            );
          }
        },
      ),
    );
  }
}
