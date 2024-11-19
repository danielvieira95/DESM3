import 'package:app_auth/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// com.prep16
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  runApp(Home());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}