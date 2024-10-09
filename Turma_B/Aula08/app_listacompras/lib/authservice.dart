import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservice {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  entrarUsuario({required String email,required String senha}){
  print('Modo entrar usuario');


}

cadastrarUsuario({
required String email,
required String senha,
required String nome
}){
  
  print('Cadastrar usuario');
}


}




