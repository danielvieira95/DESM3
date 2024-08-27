import 'package:app_restaurante/cardapio.dart';
import 'package:app_restaurante/components/Drinkitems.dart';
import 'package:flutter/material.dart';

class Drink_screen extends StatelessWidget {
  final List items = drinks;
  const Drink_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2), 
    itemBuilder: (context,index){
     return Drink_items(imageURI: items[index]['image'],
      itemPrice: items[index]['price'], 
      itemTitle: items[index]['name']);
    
    },itemCount: items.length,
    );
     // grid builder
     
  }
}