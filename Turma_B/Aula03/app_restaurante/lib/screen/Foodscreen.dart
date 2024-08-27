import 'package:app_restaurante/cardapio.dart';
import 'package:app_restaurante/components/Food.dart';
import 'package:flutter/material.dart';

class Food_screen extends StatelessWidget {
  final List items = comidas; // cria uma variavel items para armazenar a lista comidas
  const Food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
    // similar ao listview porém com algumas propriedades diferentes
    child: CustomScrollView(
      // slivers similar ao children
    slivers: [
        SliverToBoxAdapter(
        child: Text('Menu',style: TextStyle(fontFamily: 'Caveat',
        fontSize:32 ),textAlign: TextAlign.center,),
        
      ),
      // similar ao listview.builder
     SliverList(delegate: SliverChildBuilderDelegate((context, index) {
       return FoodItem(itemTitle: items[index]['name'], 
       itemPrice: items[index]['price'], 
       imageURI: items[index]['image']);
     },
     // similar ao itemscount
     childCount: items.length,
     ))
    ],
    
    ),
    );
  }
}