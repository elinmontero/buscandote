
// DISENO DEL PANEL DE MENU

import 'package:buscandote/main.dart';
import 'package:buscandote/views/acerca_de_view.dart';

import 'package:buscandote/views/informacion_view.dart';

import 'package:buscandote/views/recursos_ayuda_view.dart';
import 'package:buscandote/views/register_persona_view.dart';

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.red,    
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/desaparecidos.jpg"),
                    fit: BoxFit.cover)),
            child: Text(
              "",
              style: TextStyle(fontSize: 35, color: Colors.red),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(
              Icons.home_filled,
              color: Colors.white,
              
            ),
            title: const Text(
              'Inicio',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()))
            },
            
          ),
          const Divider(
            color: Colors.white,
           
          ),
          ListTile(
            leading: const Icon(
              Icons.person_add_alt_1_rounded,
              color: Colors.white,
            ),
            title: const Text('Registrar',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddRegistro()))
            },
          ), 
          const Divider(
            color: Colors.white,
             
          ),

         
          
          ListTile(
            leading: const Icon(
              Icons.info_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Sobre Nosotros',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Informacion()))
            },
          ),
           const Divider(
            color: Colors.white,
           
          ),        
          
           ListTile(
            leading: const Icon(
              Icons.help,
              color: Colors.white,
            ),
            title: const Text('Recursos / Ayuda',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Recursos()))
            },
          ), 
          const Divider(
            color: Colors.white,
            
          ),       

        
          

          ListTile(
            leading: const Icon(
              Icons.person_3_rounded,
              color: Colors.white,
            ),
            title: const Text('Acerca de',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Presentacion()))
            },
          ),

          
        
        ],
      ),
    );
  }
}