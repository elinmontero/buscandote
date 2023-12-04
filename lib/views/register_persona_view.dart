

import 'dart:io';

import 'package:buscandote/db/db_helper.dart';
import 'package:buscandote/input_field.dart';
import 'package:buscandote/main.dart';

import 'package:flutter/material.dart';


import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class AddRegistro extends StatefulWidget {
  const AddRegistro({super.key});
  

  @override
  State<AddRegistro> createState() => _AddRegistro();
}

class _AddRegistro extends State<AddRegistro> {
  List<String> items = ['Masculino', 'Femenino'];  
  String? selectedItem = 'Masculino';

  List<Map<String, dynamic>> _registros = [];

  XFile? image ;
  final ImagePicker picker = ImagePicker();


  // ACTUALIZAR REGISTROS
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
    print(".. numero de registros ${_registros.length}");
    
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController(); 
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _informationController = TextEditingController();
  final TextEditingController _lugarController = TextEditingController(); 
  final TextEditingController _date = TextEditingController(); 
  final TextEditingController _statusController = TextEditingController();



  // funcionalidad del metodo agregar registro
  Future<void> _agregarRegistro () async {
    
    await DBHelper.insertRegister(image.toString(), _nameController.text, 
  _ageController.text , selectedItem!,  _heightController.text ,
    _informationController.text, _lugarController.text, _date.text, _statusController.text 
    

  ); 
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).
    showSnackBar( const SnackBar(content: 
    Text("Registro agregado exitosamente")));
    actualizarRegistros();
    print(".. numero de registros ${_registros.length}");
  }
  

// Subir imagen desde la galeria
  Future<String?> getImageFromGallery() async {
  
    image = await picker.pickImage(
      source: ImageSource.gallery);

      setState(() {
        
      });

        if(image != null){
        return image!.path;
      } else{
        
        print("Imagen no seleccionada");
      }
        return null;
          
    
  }


  // CONTENIDO PRINCIPAL DE LA VISTA DE REGISTRO
  @override  

  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.black,
      appBar: AppBar(title:
      Align( 
        alignment: Alignment.topRight,
        child:
        Container(        
        height: 50,
            width: 50,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(image: AssetImage('assets/images/logoApp1.png'),
            
            )
            
          ), 
      ) ,
      ),
      backgroundColor:  Colors.black, 
      ),
      body:       
        Container(
          padding: const EdgeInsets.only(left: 20,
          top: 20,
          right: 20),
          child:   SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Agregar Registro", style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 25
                ),),
                const Divider( color: Colors.grey,
                thickness: 1,),
                const SizedBox(
                  height: 20,
                ),

                // IMAGE PICKER
                ElevatedButton.icon(
                  onPressed: (){
                    getImageFromGallery();

                  },
                  
                  icon: const Icon(Icons.image_aspect_ratio_rounded), 
                  label: const Text('Seleccionar Imagen', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),),
                  ),            
                  

          const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            
                            
                          ),
                            child: image == null ? const Text("no hay imagen", style: TextStyle(
                              color: Colors.white
                            ),) :
                            Image.file(File(image!.path)), 
                          ),
                ),             
                
                
                MyInputField(title: 'Nombre', hint: 'Digita el nombre ', controller: _nameController,),
                MyInputField(title: 'Edad', hint: 'Digita la edad', controller: _ageController,), 
                const SizedBox(height: 15,),
                
                const Text("Sexo", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ), ),
              
                const SizedBox(height: 8,),


              // GENDER SELECTOR
                DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 2, 
                  color: Colors.white),
                ),
                contentPadding:
                  const EdgeInsets.all(10),
              ),
              value: selectedItem,
              
              items: items.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: const TextStyle(
                  fontSize: 20
                ),))).toList(),
                onChanged: (item) => setState(() {
                  selectedItem = item;
                }),
                isExpanded: true,
            ),

            
            MyInputField(title: 'Estatura', hint: 'Digita la estatura', controller: _heightController,),
            MyInputField(title: 'Informacion Adicional', hint: 'señas particulares,  '
            'ultimo lugar donde fue visto', controller: _informationController, 
            
            ),
            MyInputField(title: 'Lugar de los hechos', hint: "lugar donde ocurrieron los hechos", controller: _lugarController,),
            
            const SizedBox(height: 15,),

               // DATE SELECTOR 
                const Text("Fecha de desaparicion", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ), ),
              
                const SizedBox(height: 8,),

            TextField(
              autofocus: false,
              style: const TextStyle(
                fontSize: 24,                
              ),
              controller: _date,
              decoration:   InputDecoration(
                filled: true,
                hintText: 'Seleccionar fecha',
                hintStyle: const TextStyle(
                  fontSize: 14
                ),
                fillColor: Colors.white,
                icon: const Icon(Icons.calendar_today_rounded,
                color: Colors.white,
                ),
                
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 2, 
                  color: Colors.white),
                ) ,
                contentPadding:
                  const EdgeInsets.all(10),
                
              ),

              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2000), 
                  lastDate: DateTime(2100));

                  if(pickedDate != null){
                    _date.text = DateFormat('yyyy-MM-dd').format(pickedDate);

                  }
              },
              
            ),
            
            MyInputField(title: 'Status', hint: 'actualizacion del caso', controller: _statusController,),

            const SizedBox(height: 20,),

             // BOTON DE GUARDAR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
                        
                onPressed: () => {
                      
                  _validarData()
                                    

                    },
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
                
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: [
                    Icon(
                      Icons.save_alt_sharp,
                      color:   Colors.green,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Guardar",
                      style: TextStyle(
                          color:   Colors.green,
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
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
                
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: [
                    Icon(
                      Icons.cancel_rounded,
                      color:   Colors.red,
                    ),
                    
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cancelar",
                      style: TextStyle(
                          color:   Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    
                  ],
                )),
                

             ],),

             
          

              

              ],
            ),
          ),
          
          
          
      ),
      
    );  
      
    
  }

  // VALIDACION DE LOS CAMPOS
  _validarData(){
    if(_nameController.text.isNotEmpty && _ageController.text.isNotEmpty &&
    selectedItem!.isNotEmpty && _heightController.text.isNotEmpty 
    && _informationController.text.isNotEmpty && _lugarController.text.isNotEmpty
    && _statusController.text.isNotEmpty && _date.text.isNotEmpty
    ){
      _agregarRegistro();
      actualizarRegistros();                      

                    
                      _nameController.text = '';
                      _ageController.text = '';                     
                      _heightController.text = '';
                      _informationController.text = '';
                      _lugarController.text = '';
                      _date.text = '';
                      _statusController.text = '';

                      Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())) ;     
    
      
    } else if(_nameController.text.isEmpty || _ageController.text.isEmpty ||
  selectedItem!.isEmpty || _heightController.text.isEmpty 
    || _informationController.text.isEmpty || _lugarController.text.isEmpty 
    || _statusController.text.isEmpty || _date.text.isEmpty){
      
      ScaffoldMessenger.of(context).
    showSnackBar( const SnackBar(content: 
    Text("todos los campos son requeridos")));
    
      

    }
  }
  
  
  
  
  
}