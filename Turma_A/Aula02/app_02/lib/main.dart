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
      ):null,
      body: Row(
        children: [
          if(!isMobile)
          Container(
            width: isTablet?200:200,
            color: Colors.blue,
            child: ListView(
             children: [
              DrawerHeader(
                child: Text("Menu"),
                
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
          Expanded(child: 
          Center(
            child: Column(
              children: [
                Container(color: Colors.red,height: screen_height*0.5,width: screen_width*0.7,),
                  Text('Screen width: $screen_width',style: TextStyle(fontSize: screen_width*0.04),),
                  Text('Screen height: $screen_height',style: TextStyle(fontSize: screen_width*0.04)),
                  if (isMobile) Text('This is a mobile view',style: TextStyle(fontSize: screen_width*0.04)),
                  if (isTablet) Text('This is a tablet view',style: TextStyle(fontSize: screen_width*0.04)),
                  if (isDesktop) Text('This is a desktop view',style:TextStyle(fontSize: screen_width*0.04)),
              ],
            ),
          )
          ),         
        ],
      
      ),     
      
    );
    
  }
  }

