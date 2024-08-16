import 'package:appcardapiorestaurante/cardapio.dart';
import 'package:appcardapiorestaurante/component/Food.dart';
import 'package:flutter/material.dart';


class Food_screen extends StatelessWidget {
  final List items = comidas;
  const Food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemBuilder: (context,index){
        return FoodItem(imageURI: items[index]["image"], itemTitle: items[index]["name"], 
        itemPrice: items[index]["price"], 
        );
        },
        itemCount: items.length,
        ),
    );
  }
}