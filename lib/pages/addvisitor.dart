import 'package:flutter/material.dart';
import 'package:visitorapp_frontend1/service/postservice.dart';
import 'package:visitorapp_frontend1/service/visitorservice.dart';

class addsecurity extends StatefulWidget {
  const addsecurity({super.key});

  @override
  State<addsecurity> createState() => _addsecurityState();
}

class _addsecurityState extends State<addsecurity> {
  @override

  TextEditingController name =new TextEditingController();
  TextEditingController purpose=new TextEditingController();
  TextEditingController  address =new TextEditingController();
  TextEditingController  phoneno =new TextEditingController();

  void SendValuetoApi() async
  {
    print("name :"+name.text);
    print("purpose :"+purpose.text);
    print("mobile :"+phoneno.text);
    print("address :"+address.text);


    final response =await visitorApiService().visitorData(name.text, purpose.text, address.text, phoneno.text);
    if (response["status"] == "success") {

      print("Successfully added");

    }
    else{
      print("error");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller:name,
                decoration: InputDecoration(
                    hintText: "Name ",
                    border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller:purpose,
                decoration: InputDecoration(
                    hintText: "purpose",
                    border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller:address,
                decoration: InputDecoration(
                    hintText: "address",
                    border: OutlineInputBorder()
                ),
              ),

              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(

                    onPressed: SendValuetoApi, child: Text("New visitor")),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Go Back to home"))

            ],
          ),
        ),
      ),
    );
  }
}
