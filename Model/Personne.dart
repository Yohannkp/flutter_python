import 'package:cloud_firestore/cloud_firestore.dart';
class Personne {
 String id;
 String uid;
 String Nom;
 String Prenom;
 String Age;
Personne({required this.id,required this.uid,required this.Nom,required this.Prenom,required this.Age,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Nom' : Nom ,
'Prenom' : Prenom ,
'Age' : Age ,
};}
static Personne fromJson(Map<String,dynamic> json) => Personne(id: json['id'],uid: json['uid'],Nom: json['Nom'],Prenom: json['Prenom'],Age: json['Age'],);

}