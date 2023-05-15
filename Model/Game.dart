import 'package:cloud_firestore/cloud_firestore.dart';
class Game {
 String id;
 String uid;
 String Titre;
 String DateDébut;
 String Datefin;
Game({required this.id,required this.uid,required this.Titre,required this.DateDébut,required this.Datefin,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Titre' : Titre ,
'DateDébut' : DateDébut ,
'Datefin' : Datefin ,
};}
static Game fromJson(Map<String,dynamic> json) => Game(id: json['id'],uid: json['uid'],Titre: json['Titre'],DateDébut: json['DateDébut'],Datefin: json['Datefin'],);

}