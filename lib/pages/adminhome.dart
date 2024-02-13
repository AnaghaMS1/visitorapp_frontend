import 'package:flutter/material.dart';

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
                  child: ElevatedButton(onPressed: (){}, child: Text("Add Security"))),
              SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(onPressed: (){}, child: Text("view Security"))),
              SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(onPressed: (){}, child: Text("viewall visitors"))),
            ],
          ),
        )
        ,
      ),
    );
  }
}
