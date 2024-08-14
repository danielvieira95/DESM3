import 'package:app_restaurante/screen/Highlights.dart';
import 'package:app_restaurante/themas/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  int _currentpage = 0; // index da pagina atual
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panucci Restaurante"), // titulo do app
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant, // tema do background
        actions: const <Widget> [
      Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Icon(Icons.account_circle),
      ),
     
        ],
        centerTitle: true, // centraliza o titulo do app        

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return const Home();
        })));
      },child: Icon(Icons.point_of_sale),
      
      ),
     //drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded),
              label: 'Destaques',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_bar),
              label: 'Bebidas',
            ),
          ],
        selectedItemColor: AppColors.bottomNavigationBarIconColor,
        currentIndex: _currentpage,
       
        onTap: (index) {
          setState(() {
             if(index>=5){
              index =0;
          
        }
            _currentpage = index;
          });
        },
      ),
      body: const Highlights(),
    );
      
    
  }
}