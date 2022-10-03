import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ffi';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  getuser() async {
    var users = [];
    var responce =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(responce.body);
    //print(jsonData);

    for (var i in jsonData) {
      UserModel user = UserModel(i['name'], i['username'], i['email']);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return MaterialApp(
      home: Scaffold(
        // body: Center(
        // child: ElevatedButton(onPressed: getuser, child: Text("Get"))),
        body: FutureBuilder(
          future: getuser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Text('nothing in api'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data[i].name),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

//  else {
//   return ListView.builder(
//       itemCount: snapshot.data.length,
//       itemBuilder: ((context, i) {
//         return ListTile(
//           title: Text(snapshot.data[i].name),
//         );
//       }));
class UserModel {
  var name;
  var username;
  var email;
  //constructor
  UserModel(this.name, this.username, this.email);
}
