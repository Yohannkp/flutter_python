import 'package:cloud_firestore/cloud_firestore.dart';
class Etudiant {
 String id;
 String uid;
 String Nom;
 String Prenom;
 String Age;
 String Sex;
Etudiant({required this.id,required this.uid,required this.Nom,required this.Prenom,required this.Age,required this.Sex,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Nom' : Nom ,
'Prenom' : Prenom ,
'Age' : Age ,
'Sex' : Sex ,
};}
static Etudiant fromJson(Map<String,dynamic> json) => Etudiant(id: json['id'],uid: json['uid'],Nom: json['Nom'],Prenom: json['Prenom'],Age: json['Age'],Sex: json['Sex'],);

}