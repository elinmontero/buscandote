
// VISTA PARA INFORMACION SOBRE LA APP

import 'package:buscandote/main.dart';
import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        title:
      const Align(
        alignment: Alignment.centerRight,
        child: Text( "Sobre Nosotros", style: TextStyle( fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 20
        ),

      ),
      ),
      backgroundColor:   Colors.black,
      ),
      
      body:  ListView(
        padding: const EdgeInsets.all(20),
                
        children: [
          
          Container(
            height: 300,
            width: 400,
             decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage('assets/images/logoApp.jpg'),
            fit: BoxFit.cover)
            
          ), 
          ),
          

          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 70,
          ),
          const SafeArea(
            child: Text("Hemos diseñado y creado esta aplicación con la finalidad de que tenga la funcionalidad "
            "requerida para abordar la problemática de las personas desaparecidas.", style: TextStyle(
              color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800
              
            ),
            textAlign: TextAlign.justify,),           
            
          ),
          const SizedBox(
            height: 30,

          ),
          
          const SafeArea(
            child: Text("La idea es colaborar con las instituciones y profesionales que son expertos "
            "en búsqueda, rescate; integrando metodologías y los conocimientos especializados "
            "en el área.", style: TextStyle(
              color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
              
            ),
            textAlign: TextAlign.justify,),           
            
          ),
          const SizedBox(
            height: 100,
          ),

          // BOTON DE RETORNO
          ElevatedButton(    
                  
            
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()))
                    },
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
                
                child: const Row(
                  
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color:   Colors.red,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Regresar a Inicio",
                      style: TextStyle(
                          color:   Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),
        ],
      ),
    );
  }
}