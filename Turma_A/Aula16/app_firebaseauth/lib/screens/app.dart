import 'package:app_firebaseauth/main.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Aula16"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(color: Colors.blue,
          
          child: Text("Bem vindo !",
          style: TextStyle(fontSize: 18),),),
          ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          }, child: Text("Voltar"))
          ],
        ),
      ),
    );
  }
}