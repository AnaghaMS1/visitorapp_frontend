import 'package:blog_app_frontend/Pages/menu_page.dart';
import 'package:blog_app_frontend/Pages/register_page.dart';
import 'package:blog_app_frontend/Services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitorapp_frontend1/pages/addsecurity.dart';
import 'package:visitorapp_frontend1/service/postservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email="";
  String pass="";

  TextEditingController email1=new TextEditingController();
  TextEditingController pass1=new TextEditingController();

  void SendValue() async{
    print("email :"+email1.text);
    print("password : "+pass1.text);

    final response =await PostApiService().securityApi(email, pass)
    if(response["status"]=="success"){
      String userId=response["userdata"]["_id"].toString();
      print("successfuly login :"+userId);
      SharedPreferences.setMockInitialValues({});
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("userId", userId);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPostPage()));
    }
    else if(response["status"]=="invalid email id"){
      print("invalid email id");
    }
    else
    {
      print("invalid password");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 15,),
            TextField(
              controller: email1,
              decoration: InputDecoration(
                  labelText: "Email id",
                  hintText: "Enter email id",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: pass1,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "enter valid password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: SendValue,
                child: Text("Login")),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>addsecurity()));
            },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}