import 'package:app_firebaseauth/screens/app.dart';
import 'package:app_firebaseauth/service/Auth.dart';
import 'package:flutter/material.dart';

class Createlogin extends StatefulWidget {
  const Createlogin({super.key});

  @override
  State<Createlogin> createState() => _LoginState();
}

class _LoginState extends State<Createlogin>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
            width: MediaQuery.of(context).size.width/2,
           child: TextField(
            controller: _email,
            decoration: InputDecoration(
              hintText: "Digite seu email"),
           ),
           ),
           SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller:_senha ,
              decoration: InputDecoration(hintText: "Digite sua senha",
              ),
              obscureText: true,
              obscuringCharacter:'*'            
              ),
           ),
           ElevatedButton(onPressed: ()async{
             print("${_email.text} e senha ${_senha.text}");
           
           final message = await AuthService().registration(email:_email.text ,password: _senha.text);
            if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AppScreen()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
           }, child: Text("Cadastrar")),
        
           ElevatedButton(onPressed: (){
            _email.text="";
            _senha.text="";
           }, child: Text("Limpar"))
          ],
        ),
      ),
    );
  }
}