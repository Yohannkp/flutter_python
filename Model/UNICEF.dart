import 'package:cloud_firestore/cloud_firestore.dart';
class UNICEF {
 String uid;
 String Lieu;
 String Destination;
UNICEF({required this.uid,required this.Lieu,required this.Destination,});

Map<String, dynamic> toJson(){
return{
'uid' : uid ,
'Lieu' : Lieu ,
'Destination' : Destination ,
};}
static UNICEF fromJson(Map<String,dynamic> json) => UNICEF(uid: json['uid'],Lieu: json['Lieu'],Destination: json['Destination'],);

}