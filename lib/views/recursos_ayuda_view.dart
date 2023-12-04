// VISTA DE RECURSOS Y AYUDA

import 'package:buscandote/main.dart';
import 'package:flutter/material.dart';

class Recursos extends StatelessWidget {
  const Recursos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        title: 
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "RECURSOS", style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.red
            ),
          ),
        ),
        backgroundColor:  Colors.black,
      ),
      body:  ListView(
        padding: const EdgeInsets.all(20),        
        children: [
        const Text(" ORGANIZACIONES NACIONALES E INTERNACIONALES", style: TextStyle(
          color: Colors.grey,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
        ),
        const Divider(
          color: Colors.white,
          thickness: 1,
          height: 20,
        ),
        
        const SizedBox(
          height: 40,
        ),

        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            elevation: 10,
            shadowColor: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('assets/images/logopn.jpg'),
              height: 70,
              width: 70,),

              Text("Policia Nac. Dominicana ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),)
            ],
          )

        ),

        const SizedBox(
          height: 20,
        ),

         Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            elevation: 10,
            shadowColor: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('assets/images/redcross.png'),
              height: 70,
              width: 70,),

              Text("Cruz Roja Internacional",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),)
            ],
          )

        ),
        const SizedBox(
          height: 20,
        ),

        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            elevation: 10,
            shadowColor: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('assets/images/interpol.png'),
              height: 70,
              width: 70,),

              Text("Policia Internacional ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),)
            ],
          )

        ),
        const SizedBox(
          height: 20,
        ),
         Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            elevation: 10,
            shadowColor: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('assets/images/acnur.jpg'),
              height: 70,
              width: 70,),

              Text("Agencia para Refugiados",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),)
            ],
          )

        ),

         const SizedBox(
          height: 20,
        ),

         Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) ),
            elevation: 10,
            shadowColor: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('assets/images/icmec.jpg'),
              height: 70,
              width: 50,),

              Text("International Centre",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),)
            ],
          )

        ),

        const SizedBox(
          height: 60,
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
      ]
      ),
    );
  }
}

