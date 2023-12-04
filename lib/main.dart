
// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

// ELIN ALGENES ENCARNACION MONTERO - 20198580



import 'package:buscandote/db/db_helper.dart';
import 'package:buscandote/input_information.dart';
import 'package:buscandote/navbar.dart';

import 'package:flutter/material.dart';



Future<void> main() async {


  runApp(const Buscandote());
}

class Buscandote extends StatelessWidget {

  const Buscandote({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Buscandote",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.red,
          
        )
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _registros = [];
  List<Map<String, dynamic>> _filteredRegistros = [];
  

 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _informationController = TextEditingController();
  final TextEditingController _lugarController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  late final String _imagePath;
  final TextEditingController _searchController = TextEditingController();


  void actualizarRegistros() async {
    final data = await DBHelper.getRegisters();

    setState(() {
      _registros = data;
      
      
    });
  }

  @override
  void initState() {
    
    super.initState();
    actualizarRegistros();    
    
  }

   // METODO PARA MOSTRAR DETALLES DE UN REGISTRO SELECCIONADO
  void mostrarFicha(int? id) async {

    if(id != null) {
      final existingTask =
      _registros.firstWhere((element) => element['id'] == id);
    _nameController.text = existingTask['name'];
    _ageController.text = existingTask['age'];
    _genderController.text = existingTask['gender'];
    _heightController.text = existingTask['height'];
    _informationController.text = existingTask['information'];
    _lugarController.text = existingTask['lugar'];
    _date.text = existingTask['date'];
    _statusController.text = existingTask['status'];   

    }               
    

    showModalBottomSheet(
      backgroundColor: Colors.black,      
        context: context,
        elevation: 5,
        isScrollControlled: true,
      builder: (_) => Container(        
        
        child:
        ListView(        
        padding: const EdgeInsets.only(right: 10,
        left: 10,
        top: 100),
        children: [
          Text( 
            _genderController.text == 'Masculino' ? 
            'DESAPARECIDO'  : 'DESAPARECIDA', style: const TextStyle(
            color: Colors.red,
            fontSize: 35,
            fontWeight: FontWeight.w900

          ) ,
          textAlign: TextAlign.center,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),

          const SizedBox(
            height: 60,),

          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage('assets/images/persona.png'),
            fit: BoxFit.cover
            )
            
          ), 
          ),
          const SizedBox(
            height: 10,),

          InputInformation(title: 'NOMBRE: ', hint: 'Aqui va el nombre', controller: _nameController, ),          
          InputInformation(title: 'EDAD: ', hint: 'Aqui va la edad', controller: _ageController,),
          InputInformation(title: 'GENERO: ', hint: 'Aqui va el genero', controller: _genderController), 
          InputInformation(title: 'ESTATURA: ', hint: 'Aqui va la estatura', controller: _heightController,),
          InputInformation(title: 'INFORMACION: ', hint: 'informacion adicional', controller: _informationController,),
          InputInformation(title: 'LUGAR: ', hint: 'lugar', controller: _lugarController,),
          InputInformation(title: 'FECHA : ', hint: 'fecha', controller: _date,),
          InputInformation(title: 'STATUS: ', hint: 'Actualización', controller: _statusController,),  

          const SizedBox(
            height: 120,
          ) ,         

        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [    
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
                  
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.import_export,
                      color:   Colors.blue,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Exportar a PDF",
                      style: TextStyle(
                          color:   Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),
        

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
                      color:   Colors.green,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Inicio",
                      style: TextStyle(
                          color:   Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),

                
          ],
        )
          
        ]
      ),
       ));
  }


  // metodo para actualizar informacion
  void mostrarFormularioEditar(int id) async {
    
      
      final existingTask =
      _registros.firstWhere((element) => element['id'] == id);
    _imagePath = existingTask['image'];
    _nameController.text = existingTask['name'];
    _ageController.text = existingTask['age'];
    _genderController.text = existingTask['gender'];
    _heightController.text = existingTask['height'];
    _informationController.text = existingTask['information'];
    _lugarController.text = existingTask['lugar']; 
    _date.text = existingTask['date'];
    _statusController.text = existingTask['status'];   

    

    showModalBottomSheet(
      backgroundColor: Colors.black,      
        context: context,
        elevation: 5,
        isScrollControlled: true,
      builder: (_) => Container(        
        
        child:
        ListView(        
        padding: const EdgeInsets.only(right: 10,
        left: 10,
        top: 100),
        children: [
          const Text( 
            'EDITAR INFORMACION', style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.w700

          ) ,
          textAlign: TextAlign.center,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),

          const SizedBox(
            height: 60,),

          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage('assets/images/persona.png'),
            fit: BoxFit.cover
            )
            
          ), 
          ),
          const SizedBox(
            height: 10,),

          InputInformation(title: 'NOMBRE: ', hint: 'Aqui va el nombre', controller: _nameController, ),          
          InputInformation(title: 'EDAD: ', hint: 'Aqui va la edad', controller: _ageController,),
          InputInformation(title: 'SEXO: ', hint: 'Aqui va el genero', controller: _genderController), 
          InputInformation(title: 'ESTATURA: ', hint: 'Aqui va la estatura', controller: _heightController,),
          InputInformation(title: 'INFORMACION: ', hint: 'informacion adicional', controller: _informationController,),
          InputInformation(title: 'LUGAR: ', hint: 'lugar de los hechos', controller: _lugarController,),
          InputInformation(title: 'FECHA : ', hint: 'fecha', controller: _date,),
          InputInformation(title: 'STATUS: ', hint: 'Actualización', controller: _statusController,),  

          const SizedBox(
            height: 120,
          ) ,         

        // BOTONES 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          ElevatedButton(          
            
                onPressed: () => {
                  actualizarRegistro(id),
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
                      Icons.update,
                      color:   Colors.blue,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Actualizar",
                      style: TextStyle(
                          color:   Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),
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
                      Icons.cancel_rounded,
                      color:   Colors.green,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cancelar",
                      style: TextStyle(
                          color:   Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),

        ],)
          
        ]
      ),
      ));
  }

  Future<void> actualizarRegistro(int id) async {
    await DBHelper.updateRegister(id , _imagePath,  _nameController.text, _ageController.text,
    _genderController.text, _heightController.text, _informationController.text,
    _lugarController.text, _date.text, _statusController.text);
    ScaffoldMessenger.of(context).
    showSnackBar( const SnackBar(content: 
    Text("Registro actualizado exitosamente")));
    actualizarRegistros();

  }

  // FILTRAR POR NOMBRE
  buscarPorNombre(String? name) async {

      final data = await DBHelper.searchRegisters(_searchController.text);  

      setState(() {
        _filteredRegistros = data;
      });

      return Expanded(child: ListView.builder(
        itemCount: _filteredRegistros.length,
        itemBuilder:        (context, index ) => Container(
          height: 20,
          child: ListTile(
            title: Text(_filteredRegistros[index]['name']),
          ),
        )));
      
        
  }

  

  // funcionalidad para eliminar registro
  void eliminarRegistro(int id) async {
    await DBHelper.deleteRegister(id);
    ScaffoldMessenger.of(context).
    showSnackBar( const SnackBar(content: 
    Text("Registro eliminado exitosamente")));  

  
  }

  //ELIMINANDO REGISTRO
void mostrarFormularioEliminarRegistro(int id) async {   
   
      _registros.firstWhere((element) => element['id'] == id);
        
        
    showModalBottomSheet(
      backgroundColor: Colors.black,      
        context: context,
        elevation: 10,
        isScrollControlled: true,
      builder: (_) => Container(        
        
        child:
        Column(        
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const Text( 
            'QUIERES ELIMINAR ESTE REGISTRO  ?', style:  TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700

          ) ,
          textAlign: TextAlign.center,
          ),
          

          const SizedBox(
            height: 60,),

          
          
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          ElevatedButton(          
            
                onPressed: () => {
                      eliminarRegistro(id),
                      actualizarRegistros(),
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
                  
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.cancel_rounded,
                      color:   Colors.red,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "SI",
                      style: TextStyle(
                          color:   Colors.red,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                    
                  ],
                )),
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
                      Icons.home,
                      color:   Colors.blue,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "NO",
                      style: TextStyle(
                          color:   Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),

        ],)
          
        ]
      ),
      ));
  }
  

  
// HOME PAGE
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Colors.black,
      
      drawer: const NavBar(),
      appBar:
      PreferredSize(preferredSize: const Size.fromHeight(80), child: 
      AppBar(title:
        Container(
        margin: const EdgeInsets.only(top: 15),
        height: 40,
                
                      decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ), 

          child: Row(
          
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(child: TextFormField(
                controller: _searchController,
                autofocus: false,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Buscar registro '
                ),
              )),
              IconButton(onPressed: () => {
                if(_searchController.text.isEmpty){
                  ScaffoldMessenger.of(context).
    showSnackBar( const SnackBar(content: 
    Text("Debes introducir un nombre para realizar la busqueda")))
                } else{
                  buscarPorNombre(_searchController.text)
                  
                }
              },
              icon: const Icon(Icons.search_sharp))
            ],
            
          ), 

            
          

      ),
      
        
      backgroundColor:   Colors.black,
      ),),
      
      
      body:  Column(
        children: [
                  
          Container(                
            height: 150,
            width: 120,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(image: AssetImage('assets/images/logoApp2.jpg'),            
            
            )
            
          ), 
              ),
              if(_searchController.text.isEmpty)
              showRegistros(),
          

        ],
      )
    
      
    );
  }
  // Contenedor de cada registro guardado en Home Page
  showRegistros(){
    return Expanded(child: ListView.builder(
      itemCount: _registros.length,
      itemBuilder: (context, index ) => Container(
        height: 230,
      
        child: Stack(
          children: [
            Positioned(
              top: 20,
              bottom: 30,
            child: Material(
              
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(0.0)
              
              
              ),
            ),
          )),
          Positioned(
            top: 0,
            left: 20,
            child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(borderRadius: 
            BorderRadius.circular(15.0)),
            child: Container( 
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),                
              ), 
            //  child: Image.file(File(_registros[index]['name'])),
            child:
            

            Image.asset('assets/images/persona.png')  
            ,
              
            ),
          )),
          Positioned(
            top: 30,
            left: 180,
            child: Container(
              height: 150,
              width: 180,
            child: Column(
              children: [
                Text( _registros[index]['name'], style: 
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),

                Text( 'Edad: ' +
              _registros[index]['age'], style: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),

            Text( 'Genero: ' +
              _registros[index]['gender'], style: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),

            Text( 'Estatura: ' +
              _registros[index]['height'], style: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),
                
              
            Text( 'Fecha Desap: ' +
              _registros[index]['date'], style: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),

             Text( 'Status: ' +
              _registros[index]['status'], style: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),
        

              ],
            ),
          )),
          Positioned(
            top: 150,
            left: 40,
            child: Container(
            child: Row(
              
              children: [
                IconButton(onPressed: () =>                    
                    mostrarFicha(_registros[index]['id']),
                  
                  icon: const Icon(Icons.remove_red_eye),
                  iconSize: 20,
                  color: Colors.green,
                  ), 

                  IconButton(onPressed: () =>                    
                    mostrarFormularioEditar(_registros[index]['id']),
                  
                  icon: const Icon(Icons.edit),
                  iconSize: 20,
                  color: Colors.blue,
                  ), 
                                    
                  
                  // ignore: avoid_returning_null_for_void
                  IconButton(onPressed: () => mostrarFormularioEliminarRegistro(_registros[index]['id']),
                //  eliminarRegistro(_registros[index]['id']),
                  icon: const Icon(Icons.delete),
                  iconSize: 20,
                  color: Colors.redAccent,
                  ), 
                
              ],
            ),
          ))
          ],
        ),
      )
    ));
  

  }

  


}


