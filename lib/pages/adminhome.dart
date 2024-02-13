import 'package:flutter/material.dart';
import 'package:visitorapp_frontend1/pages/addsecurity.dart';
import 'package:visitorapp_frontend1/pages/viewsecurity.dart';

class adminhome extends StatelessWidget {
  const adminhome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                width: 250,
                  height: 60,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>addsecurity()));
                  }, child: Text("Add Security"))),
              SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPost()));
                  }, child: Text("view Security"))),
              SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>adminhome()));
                  }, child: Text("viewall visitors"))),
            ],
          ),
        )
        ,
      ),
    );
  }
}
