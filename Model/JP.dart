import 'package:cloud_firestore/cloud_firestore.dart';
class JP {
 String id;
 String uid;
 String Nom;
 String Prenom;
JP({required this.id,required this.uid,required this.Nom,required this.Prenom,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Nom' : Nom ,
'Prenom' : Prenom ,
};}
static JP fromJson(Map<String,dynamic> json) => JP(id: json['id'],uid: json['uid'],Nom: json['Nom'],Prenom: json['Prenom'],);

}