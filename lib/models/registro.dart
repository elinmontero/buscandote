class Registro {
  int? id;
  String? image;
  String? name;
  int? age;
  String? gender;
  double? height;  
  String? information;
  String? date;


  Registro({ this.id, this.image,  this.name,  this.age,   
  this.gender,  this.height, this.information, this.date });

  Map<String, dynamic> toMap(){
    return{
    'id' : id,
    'image' : image,
    'name' : name,
    'age' : age,
    'gender' : gender,
    'height' : height,
    'information' : information,
    'date' : date
    };
  
  }

 factory Registro.fromMap(Map<String, dynamic> map) {
    return Registro(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      age: map['age'],
      height: map['height'],
      gender: map['gender'],
      information: map['information'],
      date: map['date'],
    );
  }
}

  
