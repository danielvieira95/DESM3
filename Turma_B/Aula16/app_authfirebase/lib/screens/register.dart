import 'package:app_authfirebase/screens/app.dart';
import 'package:app_authfirebase/services/Auth.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller: _email,
              decoration: InputDecoration(hintText: 'Digite seu email'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller: _senha,
              decoration: InputDecoration(hintText: 'Digite sua senha'),
              obscureText: true,
              obscuringCharacter: '*',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: ()async{
                print('${_email.text} e ${_senha.text}');

                final message = await AuthService().registration(email: _email.text,
                 password: _senha.text);
               if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TelaApp()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );


              }, child: Text('Cadastrar')),
               ElevatedButton(onPressed: (){
           _email.text='';
           _senha.text='';
          }, child: Text('Limpar')),
            ],
          ),
        
          ],
        ),
      ),
    );
  }
}