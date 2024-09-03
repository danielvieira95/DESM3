import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Inicializar o Firebase antes de usar qualquer serviço
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Obter a instância do Firestore
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Adicionar um documento com ID manual
  /*
  db.collection("usuarios")
      .doc("002") // Use `doc` ao invés de `document`
      .set({
        "nome" : "Ana Maria Silva",
        "idade" : "25"
      });
  */

  // Adicionar um documento com ID gerado automaticamente
  /*
  DocumentReference ref = await db.collection("noticias").add({
    "titulo" : "Ondas de calor em São Paulo",
    "descricao" : "texto de exemplo..."
  });

  // O ID do documento é gerado automaticamente
  print("item salvo: " + ref.id); // Use `ref.id` ao invés de `ref.documentID`
  */

  // Atualizar um documento existente
  db.collection("noticias").doc("-LhaOOJeVlsPbbAoZaql").set({
    "titulo": "Ondas de calor em São Paulo alterado",
    "descricao": "texto de exemplo..."
  });

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Firestore Example')),
        body: Center(child: Text('Firestore data saved successfully!')),
      ),
    );
  }
}
