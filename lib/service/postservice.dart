import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:visitorapp_frontend1/model/postmodel.dart';

class PostApiService{
  Future<dynamic> sendData(
      String name,
      String age,
      String address,
      String phoneno,
      String pincode,
      String emailid,
      String password,

      ) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/security/add");

    var response = await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type":"application/json ; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
        {

          "name": name,
          "age": age,
          "phoneno": phoneno,
          "address": address,
          "pincode": pincode,
          "emailid": emailid,
          "password": password,



        })

    );
    if(response.statusCode==200){
      return jsonDecode(response.body);

    }
    else{
      throw Exception("failed to send data");
    }


  }


  Future<List<Posts>> getPosts() async{
    var client =http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/security/view");
    var response = await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return postsFromJson(response.body);
    }
    else
    {
      return [];
    }

  }


}