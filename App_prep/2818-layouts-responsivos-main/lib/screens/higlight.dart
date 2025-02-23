import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  final List items = destaques;
  const Highlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemBuilder: (context,index){
        return HighlightItem(imageURI: items[index]["image"], itemTitle: items[index]["name"], 
        itemPrice: items[index]["price"], 
        itemDescription: items[index]["description"]);
        },
        itemCount: items.length,
        ),
    );
  }
}