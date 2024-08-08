import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("App aula 02"), 
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.red,)), // expanded responsivo
          Expanded(child: Text('Mobile 3',style: TextStyle(fontSize: 30),)),
          Expanded(child: Container(color: Colors.blue,)),
          Expanded(child:TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText:"Digite seu nome" ),
           )),
        ],

      ),
    );
  }
}