import 'package:blocapis/Models/user%20model.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatelessWidget {
  final UserModel e;
  const Detailscreen({super.key,required this.e});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: CircleAvatar(radius: 60,backgroundImage: NetworkImage(e.avatar),)),
          SizedBox(height: 10,),
          Text(e.firstName + " "+ e.lastName),
          Text(e.email),
        ],
      ),
    );
  }
}