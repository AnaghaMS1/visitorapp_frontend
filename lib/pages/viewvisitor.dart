
import 'package:flutter/material.dart';
import 'package:visitorapp_frontend1/model/postmodel.dart';
import 'package:visitorapp_frontend1/service/visitorservice.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  Future<List<Posts>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=visitorApiService().getPosts1();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("view all visitors"),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                print("dfhgfvj");
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(snapshot.data![index].name.toString()),
                              subtitle: Text(snapshot.data![index].address.toString()+ "\n"
                                  + snapshot.data![index].phoneno.toString()
                              ),
                            ),


                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),

      ),
    );
  }
}