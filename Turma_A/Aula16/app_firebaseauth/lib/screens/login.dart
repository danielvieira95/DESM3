import 'package:app_firebaseauth/screens/app.dart';
import 'package:app_firebaseauth/screens/createlogin.dart';
import 'package:app_firebaseauth/service/Auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>
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
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
            width: MediaQuery.of(context).size.width/2,
           child: TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: "Digite seu email"),
           ),
           ),
           SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller:senha ,
              decoration: InputDecoration(hintText: "Digite sua senha",
              ),
              obscureText: true,
              obscuringCharacter:'*'            
              ),
           ),
           ElevatedButton(onPressed: ()async{
             print("${email.text} e senha ${senha.text}");
             final message = await AuthService().login(email: email.text, password: senha.text);
           if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => AppScreen(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                
          
           }, child: Text("Login")),
        
           ElevatedButton(onPressed: (){
            email.text="";
            senha.text="";
           }, child: Text("Limpar")),
           TextButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>Createlogin()));
           }, child: Text("Novo por aqui ? Cadastre-se"))
          ],
        ),
      ),
    );
  }
}