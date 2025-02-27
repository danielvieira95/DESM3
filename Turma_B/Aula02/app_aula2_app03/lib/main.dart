import 'package:flutter/material.dart';

void main() {
  runApp(Tela());
  
}
class Tela extends StatelessWidget {
  const Tela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Telaresponsive(),
    );
  }
}
class Telaresponsive extends StatelessWidget {
  const Telaresponsive({super.key});

  @override
  Widget build(BuildContext context) {
   final mediaquerydata = MediaQuery.of(context).size; // armazena informações sobre a tela do app
   final screen_height = mediaquerydata.height; // altura da tela
   final screen_width = mediaquerydata.width; // largura da tela
   
    // Definir os breakpoints
    final isMobile = screen_width < 600;
    final isTablet = screen_width >= 600 && screen_width < 1024;
    final isDesktop = screen_width >= 1024;

    return Scaffold(
      appBar: AppBar(
        title: Text("App tela responsiva"),
      ),
       drawer: isMobile
          ? Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text('Menu'),
                  ),
                  ListTile(
                    title: Text('Tela 1'),
                  ),
                  ListTile(
                    title: Text('Tela 2'),
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile)
            Container(
              width: isTablet ? 200 : 250,
              color: Colors.blue[100],
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text('Menu'),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(color: Colors.red,height: screen_height*0.5,width: screen_width*0.5,),
                  Text('Screen width: $screen_width',style: TextStyle(fontSize: screen_width*0.04),),
                  Text('Screen height: $screen_height',style: TextStyle(fontSize: screen_width*0.04)),
                  if (isMobile) Text('This is a mobile view',style: TextStyle(fontSize: screen_width*0.04)),
                  if (isTablet) Text('This is a tablet view',style: TextStyle(fontSize: screen_width*0.04)),
                  if (isDesktop) Text('This is a desktop view',),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
