import 'package:flutter/material.dart';
import 'package:visitorapp_frontend1/service/postservice.dart';

class addsecurity extends StatefulWidget {
  const addsecurity({super.key});

  @override
  State<addsecurity> createState() => _addsecurityState();
}

class _addsecurityState extends State<addsecurity> {
  @override

  TextEditingController name =new TextEditingController();
  TextEditingController age=new TextEditingController();
  TextEditingController  address =new TextEditingController();
  TextEditingController  pincode =new TextEditingController();
  TextEditingController  phoneno =new TextEditingController();
  TextEditingController  email =new TextEditingController();
  TextEditingController  password =new TextEditingController();

  void SendValuetoApi() async
  {
    print("name :"+name.text);
    print("age :"+age.text);
    print("mobile :"+phoneno.text);
    print("address :"+address.text);
    print("pincode :"+pincode.text);
    print("email :"+email.text);
    print("password :"+password.text);
    final response =await PostApiService().sendData(name.text, age.text,
        address.text, phoneno.text, pincode.text, email.text, password.text);
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
                controller:age,
                decoration: InputDecoration(
                    hintText: "age",
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
              TextField(
                controller:pincode,
                decoration: InputDecoration(
                    hintText: "pincode",
                    border: OutlineInputBorder()
                ),
              ),   TextField(
                controller:email,
                decoration: InputDecoration(
                    hintText: "email id",
                    border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller:password,
                decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder()
                ),
              ),

              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(

                    onPressed: SendValuetoApi, child: Text("Create")),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Go Back to home"))

            ],
          ),
        ),
      ),
    );
  }
}
