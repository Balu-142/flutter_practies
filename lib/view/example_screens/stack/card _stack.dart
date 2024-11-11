import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practices/view/example_screens/bottam_bar.dart';
import 'package:practices/view/interview/bottom_navbar.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await showDialog<XFile>(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose an option'),
        actions: <Widget>[
          TextButton(
            child: Text('Camera'),
            onPressed: () async {
              Navigator.of(context).pop(await _picker.pickImage(source: ImageSource.camera));
            },
          ),
          TextButton(
            child: Text('Gallery'),
            onPressed: () async {
              Navigator.of(context).pop(await _picker.pickImage(source: ImageSource.gallery));
            },
          ),
        ],
      );
    });

    if (pickedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected: ${pickedFile.path}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Profile Page'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.blue,
                height: 250,
                width: MediaQuery.of(context).size.width * 1.0,
             // decoration: BoxDecoration(
             //   image: DecorationImage(image: Image.asset("image2.png"),
             //   fit: BoxFit.cover)
             // ),

             // decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: NetworkImage("image2.png"),
        //   fit: BoxFit.cover,
        // ),),
                child: Column(
                  children: [
                    Positioned(
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 64,
                          child: IconButton(
                            onPressed: () {
                              _pickImage(context);
                            },
                            icon: Icon(Icons.camera_enhance),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 40.0,
                child: new Container(
                  margin: const EdgeInsets.all(16.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Align(
                        alignment: Alignment.bottomCenter,
                        child: new ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => BotanNavbar()),
                                );
                              },
                              child: new Text(
                                "Register",
                                style: new TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BotanNavbar()),
                    );
                  },
                  child: Container(
                    height: 70,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Notification",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>BotanNavbar()));
                  },
                  child: Container(
                    height: 70, // Increase the height here
                    child: Center(
                      child: Text("My orders", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BotanNavbar()),
                    );
                  },
                  child: Container(
                    height: 70,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Cart",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),

              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BotanNavbar()),
                    );
                  },
                  child: Container(
                    height: 70,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Notification",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 70,
                  child: Center(
                    child: Text("Updates", style: TextStyle(fontSize: 24,)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.blue,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => BotanNavbar()),
                        );
                      },
                      child: Container(
                        height: 70,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            "privacy policy",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => BotanNavbar()),
                          );
                        },
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "Notification",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => BotanNavbar()),
                          );
                        },
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "Notification",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
