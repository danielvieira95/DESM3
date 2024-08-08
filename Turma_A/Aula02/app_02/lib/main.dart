import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Tela1(),
  ));
}

class Tela1 extends StatelessWidget {
  Tela1({super.key});
  
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size; // variavel do tipo screen pega o tamanho da tela
    final screen_width = screen.width; // largura da tela 
    final screen_height = screen.height; // altura da tela
    final isMobile = screen_width < 600;
    final isTablet = screen_width >= 600 && screen_width < 1024;
    final isDesktop = screen_width >= 1024;
    return Scaffold(
      appBar: AppBar(
        title: Text("App responsivo"),        
        
      ),
      drawer: isMobile ?
      Drawer(
        child: ListView(
          children: [
           DrawerHeader(child: Text("Menu"),
           
           ),
           ListTile(
            title: Text("Item 1"),
           ),
           ListTile(
            title: Text("Item 2"),
           )
          ],
        ),
      ),
      
    );
  }
  }

