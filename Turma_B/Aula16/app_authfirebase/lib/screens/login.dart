import 'package:app_authfirebase/screens/app.dart';
import 'package:app_authfirebase/screens/register.dart';
import 'package:app_authfirebase/services/Auth.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Digite seu email'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller: senha,
              decoration: InputDecoration(hintText: 'Digite sua senha'),
              obscureText: true,
              obscuringCharacter: '*',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: ()async{
                print('${email.text} e ${senha.text}');
                final message = await AuthService().login(email: email.text, password: senha.text);
              
               if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => TelaApp(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
              
              
              
              }, child: Text('Login')),
               ElevatedButton(onPressed: (){
           email.text='';
           senha.text='';
          }, child: Text('Limpar')),
            ],
          ),
          TextButton(onPressed: (){
          Navigator.push(context,
           MaterialPageRoute(builder: (context)=>Registro()));
          }, child: Text('Novo por aqui ! Cadastre-se'))
          ],
        ),
      ),
    );
  }
}