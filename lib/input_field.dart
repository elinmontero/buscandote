// DISENO  DE LOS  CAMPOS DE TEXTO PARA FORMULARIO DE REGISTRO

import 'package:flutter/material.dart';


class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
 
  final Widget? widget;


  const MyInputField({super.key, required this.title, required this.hint, this.controller, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child:  Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title, style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.grey
        ), ),

        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 8),
          
            
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ), 

          child: Row(
          
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(child: TextFormField(              
                autofocus: false,
                controller: controller,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: hint
                ),
                
              ))
            ],
          ),    
          
        )
      ],),
    );
  }
}