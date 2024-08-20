import 'package:appcardapiorestaurante/cardapio.dart';
import 'package:appcardapiorestaurante/component/Highlights_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Highlight extends StatelessWidget {
  final List items = destaques;
  Highlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
    child:CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Text("Destaques")),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Highlight_items(
                img: items[index]["image"],
                nome: items[index]["name"],
                price: items[index]["price"],
                description: items[index]["description"]);
            
          
        },
        childCount: items.length,
        ),
       
        ),
        
       
      ],
    ),  
    
    
    
     
      
      );
  }
}