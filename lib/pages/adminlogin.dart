import 'package:flutter/material.dart';
class adminlogin extends StatefulWidget {
  const adminlogin({super.key});

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  @override
  String getemailid ="admin";
  String getpassword="1234";
  TextEditingController emailid=new TextEditingController();
  TextEditingController password=new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: emailid,
              decoration: InputDecoration(
                hintText: "Email id",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              if(getemailid==emailid.text && getpassword ==password)
                {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>adminhome()));
                }
            }, child: Text("Login")),


          ],
        ),
      ),
    );
  }
}
