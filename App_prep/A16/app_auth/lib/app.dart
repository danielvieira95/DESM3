import 'package:app_auth/main.dart';
import 'package:app_auth/screens/createlogin.dart';
import 'package:app_auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Home"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
           Container(color: Colors.blue,width: 200,height:200,
           child:Text('Bem vindo',style:TextStyle(fontSize: 18)))
          ],
        ),
      ),
    );
  }
}
