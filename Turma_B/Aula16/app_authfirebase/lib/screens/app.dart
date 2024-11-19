import 'package:app_authfirebase/main.dart';
import 'package:app_authfirebase/screens/login.dart';
import 'package:app_authfirebase/services/Auth.dart';
import 'package:flutter/material.dart';

class TelaApp extends StatefulWidget {
  const TelaApp({super.key});

  @override
  State<TelaApp> createState() => _TelaAppState();
}

class _TelaAppState extends State<TelaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('App aula 16'),
      backgroundColor: Colors.blue,
    ),
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 200,height: 200,
          color: Colors.blue,child: 
          Text('Bem vindo',style: TextStyle(fontSize: 18),),),
          ElevatedButton(onPressed: ()async{
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> Home()));
            final message = await AuthService().logout();
            print(message);
       
          }, child: Text('Sair'))
        ],
       
       ),
     ),
    );
  }
}