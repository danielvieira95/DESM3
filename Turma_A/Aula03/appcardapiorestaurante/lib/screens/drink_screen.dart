import 'package:appcardapiorestaurante/cardapio.dart';
import 'package:appcardapiorestaurante/component/Drink.dart';
import 'package:flutter/material.dart';

/*class Drink_screen extends StatelessWidget {
  final List items = drinks;
   

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Menu",
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return DrinkItem(
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                  imageURI: items[index]['image']);
            }, childCount: items.length))
          ],
        ));
  }
}*/
class Drink_screen extends StatelessWidget {
  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2),
    
     itemBuilder: (context,index){
      return DrinkItem(imageURI: items[index]['image'],
       itemTitle: items[index]['name'],
        itemPrice: items[index]['price']);

     },
     itemCount: items.length,
     );

  }
}