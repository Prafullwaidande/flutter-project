import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyLinux extends StatefulWidget {
  @override
  _MyLinuxState createState() => _MyLinuxState();
}

class _MyLinuxState extends State<MyLinux> {
  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;
  
  String chatmsg;
  var cmd;
  var webdata;
  
  myweb(cmd)async{
  var url = "http://192.168.10.10/cgi-bin/linux.py?x=${cmd}";
  var r = await http.get(url);
  
  setState(() {
   webdata = r.body;  
  });

 print(webdata);

}

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var signInuser  = authc.currentUser.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("Linux"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), 
          onPressed: () async{
            print("Sign off");
           await authc.signOut();
           Navigator.pushNamed(context, "login");
          }),
        ],
      ),
      body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      
              Container(width: 150,
              height: 30,
              alignment: Alignment.bottomCenter,
              
              child: Text(
                'Red Hat 8',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              ),
               SizedBox(height: 20,),
              Text(webdata ?? "Waiting for your command..."),
               SizedBox(height: 20,),
        Row(
          children: [
            Container(
              
              width: deviceWidth * 0.70,
              child: TextField(
                decoration: InputDecoration(hintText: " Enter msg...",
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                ),
                
                onChanged: (value){
                    cmd = value;
              }
              ),
            ),
            Container(
              width: deviceWidth * 0.20,
              child: FlatButton( 
                child: Text("send"),
              onPressed: () async {
                myweb(cmd);
                 var fsconnect = FirebaseFirestore.instance;
                await fs.collection("chat").add({
                  "Command": cmd,
                  "Output": webdata,
                });
              },
              ),
            ),
          ],
        ),
      ]
      ),
    ),
    );
  }
}