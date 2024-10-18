import 'package:flutter/material.dart';

class Createcount extends StatefulWidget {
  const Createcount({super.key});

  @override
  State<Createcount> createState() => _CreatecountState();
}

class _CreatecountState extends State<Createcount>
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
              print("${_emailcontroller.text}, ${_passwordcontroller.text}");
            },
             child: Text("Registrar")),
          SizedBox(
            height: 30,
          ),
         
          ],
        
        ),
      ),
    );
}
}