import 'package:app_restaurante/themas/app_colors.dart';
import 'package:flutter/material.dart';

class Highlights_Items extends StatelessWidget {
  final String imageurl; // variavel para passar o caminho da imagem
  final String nome; // variavel para passar o nome de item
  final String price; // variavel para passar o preco
  final String description; // variavel para passar o description
  Highlights_Items({Key?key, required this.imageurl, required this.nome,
  required this.price, 
  required this.description}):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // Card  widget
    return Card(
      clipBehavior: Clip.hardEdge, 
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      child: Column(
      children: [
        Image(image: AssetImage(imageurl),fit: BoxFit.cover,),
        Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch, // alinhamento 
          children: [            
            Text(nome,style: TextStyle(fontSize: 16),),
            Text("R \$" + price,style: TextStyle(fontSize: 16),),
            Padding(padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(description)),
            Align(
              alignment:Alignment.centerRight,
              child: ElevatedButton(onPressed: () {
                
              },child:Text("Pedir") ,style: AppColors.buttonStyle,),
            ),

          ],
        ),
        ),



      ],
      ),

    );
  }
}