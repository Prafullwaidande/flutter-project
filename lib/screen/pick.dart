import 'package:flutter/material.dart';

class MyPick extends StatefulWidget {
  @override
  _MyPickState createState() => _MyPickState();
}

class _MyPickState extends State<MyPick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Catagories"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 190,
                  height: 100,
                  child: Text('Linux'),
                  onPressed: (){
                  Navigator.pushNamed(context, "linux");
                },
                ),
              ),
              SizedBox(
                height: 40,
                ),
                Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 190,
                  height: 100,
                  child: Text('Chat Box'),
                  onPressed: (){
                  Navigator.pushNamed(context, "chatpage");
                },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}