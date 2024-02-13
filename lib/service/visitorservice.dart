import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:visitorapp_frontend1/model/postmodel.dart';

class visitorApiService{
  Future<dynamic> visitorData(
      String name,
      String purpose,
      String address,
      String phoneno,


      ) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/visitor/add");

    var response = await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type":"application/json ; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
        {

          "name": name,
          "Purpose": purpose,
          "phoneno": phoneno,
          "address": address,




        })

    );
    if(response.statusCode==200){
      return jsonDecode(response.body);

    }
    else{
      throw Exception("failed to send data");
    }


  }


  Future<List<Posts>> getPosts1() async{
    var client =http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/visitor/view");
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