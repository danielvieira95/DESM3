import 'package:app_restaurante/themas/app_colors.dart';
import 'package:flutter/material.dart';

class CounterComponente extends StatefulWidget {
  const CounterComponente({super.key});

  @override
  State<CounterComponente> createState() => _CounterComponenteState();
}

class _CounterComponenteState extends State<CounterComponente> {
  int _counter =1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState((){
            _counter ++;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.counterButtonColor,
              
            ),
            child: Icon(Icons.arrow_drop_up),
          ),
        ),
        Text(_counter.toString()), // converte a variavel counter para string
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap:() {
            setState((){
             _counter--;
            });
          },
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.counterButtonColor,
          ),
          child: Icon(Icons.arrow_drop_down),
          ),
        ),


      ],
    );
  }
}