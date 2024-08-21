import 'package:app_restaurante/cardapio.dart';
import 'package:flutter/material.dart';

class Drink_items extends StatelessWidget {
  final List items = drinks; // lista com os drinks
  Drink_items({Key? key, required this.imageURI,
  required this.itemPrice,
  required this.itemTitle}):super(key:key);
  final String imageURI;
  final String itemPrice;
  final String itemTitle;
  


  @override
  Widget build(BuildContext context) {
    // widget card
    return Card(
     clipBehavior: Clip.hardEdge,
     color: Theme.of(context).colorScheme.surfaceVariant,
     child: Column(
      children: [
        Image(
          height: 90,
          width: double.infinity,
          image: AssetImage(imageURI),
          fit: BoxFit.cover,
          ),
          Padding(padding: EdgeInsets.fromLTRB(16.0, 16.0,
           16.0, 0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(itemTitle,style: TextStyle(
                fontSize: 16),),
                Text("R\$ ${itemPrice}",
                style: TextStyle(fontSize: 16),),
                


            ],
           ),
           ),

      ],
     ),
    );
  }
}