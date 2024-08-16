import 'package:appcardapiorestaurante/component/Highlights_item.dart';
import 'package:appcardapiorestaurante/screens/Food_screen.dart';
import 'package:appcardapiorestaurante/screens/Highlight.dart';
import 'package:appcardapiorestaurante/themas/appcolors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentpage = 0; // cria a variavel para o bottom navigator
  static  List<Widget> _widgetop =[
   Highlight(),
   Food_screen(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Pannuci Restaurante"),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      actions: <Widget>[
      Padding(padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.account_circle),
      ),
      ],
      centerTitle: true,
      ),
       floatingActionButton: FloatingActionButton(onPressed: ()
       {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return const Home();
        })));
      },child: Icon(Icons.point_of_sale),
      
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>
        [  
        BottomNavigationBarItem(
          icon: Icon(Icons.star),label:'Destaque' ),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu),
        label: 'Menu'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.local_bar),
        label: 'drink'),


        ],
        selectedItemColor: AppColors.bottomNavigationBarIconColor, // muda a cor
        //do item selecionado 
        currentIndex: _currentpage, // variavel do index conforme a seleção
        onTap: (index) {
          setState((){
            if(index>5){
              index =0;
            }
            _currentpage = index;
          
          });
          
        },

        
        ),
        body: Center(
          child: _widgetop.elementAt(_currentpage),
        ),
    );
  }
}