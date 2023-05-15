import 'package:cloud_firestore/cloud_firestore.dart';
class Mouton {
 String id;
 String uid;
 String nom;
 String prenom;
Mouton({required this.id,required this.uid,required this.nom,required this.prenom,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'nom' : nom ,
'prenom' : prenom ,
};}
static Mouton fromJson(Map<String,dynamic> json) => Mouton(id: json['id'],uid: json['uid'],nom: json['nom'],prenom: json['prenom'],);

}