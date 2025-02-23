import 'package:app_auth/app.dart';
import 'package:app_auth/main.dart';
import 'package:app_auth/screens/createlogin.dart';
import 'package:app_auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Login"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SizedBox(
              width:MediaQuery.of(context).size.width/2 ,
              child: TextField(
               controller: email,
               decoration:InputDecoration(hintText: 'Digite seu email') ,
              ),
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: senha,
                decoration: InputDecoration(hintText: 'Digite sua senha',),
                obscureText: true,
                obscuringCharacter: '*',


              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: ()async{
                  print("${email.text} e ${senha.text}");
                   final message = await AuthService().login(
                  email: email.text,
                  password: senha.text,
                );
                if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => TelaHome(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                
                        
                }, child: Text('Login', style: TextStyle(fontSize: 18))),
                 ElevatedButton(
                    onPressed: () async{
                      email.text = "";
                      senha.text = "";
                     
                 
                      
              },
                    
                    child: Text('Limpar', style: TextStyle(fontSize: 18))),
              ],
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>

               Createlogin()));

            }, child: Text('Cadastre-se',style: TextStyle(fontSize: 18),))
           
          ],
        ),
      ),
    );
  }
}
