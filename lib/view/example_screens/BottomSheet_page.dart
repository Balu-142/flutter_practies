import 'package:flutter/material.dart';
import 'package:practices/view/profile/provider/cart_screen.dart';

class BottomSheet_page extends StatefulWidget {
  const BottomSheet_page({super.key});

  @override
  State<BottomSheet_page> createState() => _BottomSheet_pageState();
}

class _BottomSheet_pageState extends State<BottomSheet_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.notification_add_rounded)),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Balu",style: TextStyle(fontWeight: FontWeight.w600,),),
            Text("Flutter Developer" , style: TextStyle(fontSize: 16),),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(child: Icon(Icons.person),radius: 20,),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            child: ElevatedButton(
              child: Text("click"),
              onPressed: BottamPage,
            ),
          ),
        ],
      ),
    );
  }

  void BottamPage() {
    showBottomSheet(context: context, builder: (BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("close")),
          SizedBox(height: 20,),
          // CartPage(),
        ],
      ),
    );
    }
    );
  }
}


