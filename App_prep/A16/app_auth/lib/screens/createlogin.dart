import 'package:app_auth/main.dart';
import 'package:app_auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Createlogin extends StatefulWidget {
  const Createlogin({super.key});

  @override
  State<Createlogin> createState() => _CreateloginState();
}

class _CreateloginState extends State<Createlogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _email,
                decoration: InputDecoration(hintText: 'Digite seu email'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _senha,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                ),
                obscureText: true,
                obscuringCharacter: '*',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: ()async {
                      print("${_email.text} e ${_senha.text}");
                      final message = await AuthService().registration(
                   email: _email.text,
                  password: _senha.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );

},
                    child: Text('Cadastrar', style: TextStyle(fontSize: 18))),


                ElevatedButton(
                    onPressed: () {
                      _email.text = "";
                      _senha.text = "";
                    },
                    child: Text('Limpar', style: TextStyle(fontSize: 18))),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

