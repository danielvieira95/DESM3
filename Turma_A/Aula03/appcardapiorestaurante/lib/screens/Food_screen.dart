import 'package:appcardapiorestaurante/cardapio.dart';
import 'package:appcardapiorestaurante/component/Food.dart';
import 'package:flutter/material.dart';


class Food_screen extends StatelessWidget {
  final List items = comidas;
  const Food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text("Menu",style: TextStyle(fontFamily: 'Caveat',fontSize: 32),
            textAlign: TextAlign.center,
            ),
          ),
          SliverList(delegate:SliverChildBuilderDelegate((context,index){
            return FoodItem(itemTitle: items[index]['name'], itemPrice: items[index]['price'],
             imageURI: items[index]['image']);
             
          },
          childCount: items.length) )
        ],
      )
      
      
      
    );
  }
}