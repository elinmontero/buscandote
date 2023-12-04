
// VISTA DE MI PRESENTACION

import 'package:buscandote/main.dart';
import 'package:flutter/material.dart';

class Presentacion extends StatelessWidget {
  const Presentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        title:
      const Align(
        alignment: Alignment.topRight,
        child: Icon(Icons.person, color: Colors.grey,
        size: 40,),
      ),
      backgroundColor:   Colors.black,
      ),
      
      body:  Center(
        
        child: 
      Column(        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(                
            height: 100,
            width: 200,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(image: AssetImage('assets/images/logoitla.jpg'), 
                      
            
            )
            
          ), 
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('ELIN ENCARNACIÓN MONTERO', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                color: Colors.redAccent
              ),),
              const SizedBox(
                height: 50,
              ),
              const Text('2019-8580', style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                color: Colors.redAccent
              ),),

              const SizedBox(
                height: 50,
              ),

              const Text('INTRODUCCIÓN AL DESARROLLO DE APPS MÓVILES', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                color: Colors.redAccent
              ),
              textAlign: TextAlign.center,),

              const SizedBox(
                height: 50,
              ),

              const Text('PROYECTO FINAL', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                color: Colors.redAccent
              ),),

               const SizedBox(
                height: 100,
              ),

              ElevatedButton(
                        
                onPressed: () => {
                      
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()))
                                    

                    },
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
                
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Icon(
                      Icons.home_filled,
                      color:   Colors.white,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Volver",
                      style: TextStyle(
                          color:   Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),
          
        ],
      ),)
    );
  }
}