import 'package:appcardapiorestaurante/cardapio.dart';
import 'package:appcardapiorestaurante/component/Highlights_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Highlight extends StatelessWidget {
  final List items = destaques;
  Highlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(16,16,16,0),
    child:CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Text("Destaques",style: TextStyle(fontFamily: "Caveat",fontSize: 32),
        textAlign: TextAlign.center,
        )),
        
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