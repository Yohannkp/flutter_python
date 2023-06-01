import 'package:cloud_firestore/cloud_firestore.dart';
class Yohann {
 String id;
 String uid;
 String Produit;
Yohann({required this.id,required this.uid,required this.Produit,});

Map<String, dynamic> toJson(){
return{
'id' : id ,
'uid' : uid ,
'Produit' : Produit ,
};}
static Yohann fromJson(Map<String,dynamic> json) => Yohann(id: json['id'],uid: json['uid'],Produit: json['Produit'],);

}