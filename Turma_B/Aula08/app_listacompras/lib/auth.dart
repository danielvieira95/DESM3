import 'package:app_listacompras/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<Auth> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _message;
  bool _isLoading = false;

  bool _validateInputs() {
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      setState(() {
        _message = "Please enter a valid email.";
      });
      return false;
    }
    if (_passwordController.text.length < 6) {
      setState(() {
        _message = "Password must be at least 6 characters.";
      });
      return false;
    }
    return true;
  }

  Future<void> _signIn() async {
    if (!_validateInputs()) return;
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signUp() async {
    if (!_validateInputs()) return;
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _message = "Signed up as ${userCredential.user?.email}";
        _emailController.clear();
        _passwordController.clear();
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator()
            else ...[
              ElevatedButton(
                onPressed: _signIn,
                child: Text("Sign In"),
              ),
              ElevatedButton(
                onPressed: _signUp,
                child: Text("Sign Up"),
              ),
            ],
            if (_message != null) ...[
              SizedBox(height: 20),
              Text(_message!),
            ]
          ],
        ),
      ),
    );
  }
}
