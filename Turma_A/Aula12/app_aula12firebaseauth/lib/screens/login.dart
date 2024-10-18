import 'package:app_aula12firebaseauth/screens/auth_service.dart';
import 'package:app_aula12firebaseauth/screens/createcount.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();


   
 

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
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: "Digite seu email"
              ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: TextField(
              controller: _passwordcontroller,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: "Digite sua senha"
              ),
        
            ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
             // AuthService(_emailcontroller.text,_passwordcontroller.text);
              print("${_emailcontroller.text}, ${_passwordcontroller.text}");
            },
             child: Text("Login")),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>Createcount()));
            }, child: Text("Create acount"))
          ],
        
        ),
      ),
    );
}
}