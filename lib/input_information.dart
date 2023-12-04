
// DISENO  DE LOS  CAMPOS DE TEXTO PARA MOSTRAR Y/O EDITAR INFORMACION


import 'package:flutter/material.dart';

class InputInformation extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
 
  final Widget? widget;
 

  const InputInformation({super.key, required this.title, required this.hint, this.controller, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
     
            
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
         children: [
        Text(title, style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.grey
        ), ),
        Container(
          
          height: 30,
          width: 250,                   
            
          
          child: TextFormField( 
                controller: controller,
                style: const TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                    
                  )
                ),
          ), ) 
      

      ],
      
    ),

    );
  }
}