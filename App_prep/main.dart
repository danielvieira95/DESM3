import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {

  Firestore db = Firestore.instance;
  
  QuerySnapshot querySnapshot = await db.collection("usuarios")
  //.where("nome", isEqualTo: "jamilton")
  //.where("idade", isEqualTo: 31)
  .where("idade", isGreaterThan: 15)//< menor, > maior, >= maior ou igual, <= menor ou igual
  //.where("idade", isLessThan: 30)
  //descendente (do maior para o menor) ascendente (do menor para o maior)
  .orderBy("idade", descending: true )
  .orderBy("nome", descending: false )
  .limit(1)
  .getDocuments();

  for( DocumentSnapshot item in querySnapshot.documents ){
    var dados = item.data;
    print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
  }
  

  runApp(App());

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

