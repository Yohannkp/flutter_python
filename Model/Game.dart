import 'package:cloud_firestore/cloud_firestore.dart';
class Game {
 String id;
 String uid;
 String Titre;
 String DateD�but;
 String Datefin;
Game({required this.id,required this.uid,required this.Titre,required this.DateD�but,required this.Datefin,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Titre' : Titre ,
'DateD�but' : DateD�but ,
'Datefin' : Datefin ,
};}
static Game fromJson(Map<String,dynamic> json) => Game(id: json['id'],uid: json['uid'],Titre: json['Titre'],DateD�but: json['DateD�but'],Datefin: json['Datefin'],);

}