import 'package:cloud_firestore/cloud_firestore.dart';
class Maison {
 String id
 String uid
 String Lieu
 String Date_creatio
Maison({this.id,this.uid,this.Lieu,this.Date_creatio,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Lieu' : Lieu ,
'Date_creatio' : Date_creatio ,
};}
static Maison fromJson(Map<String,dynamic> json) => Maison(id: json['id'],uid: json['uid'],Lieu: json['Lieu'],Date_creatio: json['Date_creatio'],);

}