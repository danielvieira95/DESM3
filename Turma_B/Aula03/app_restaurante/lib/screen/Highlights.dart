import 'package:app_restaurante/cardapio.dart';
import 'package:app_restaurante/components/Highlights_item.dart';
import 'package:flutter/material.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});
   final List items = destaques; // importa os destaques da tela cardapio
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemBuilder: (context,index){
          return Highlights_Items(imageurl:items[index]["image"] ,
          nome:items[index]["name"],price: items[index]["price"],
          description: items[index]["description"],
          );
          

        },itemCount:items.length ,));
  }
}