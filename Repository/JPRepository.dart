import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class JPRepository{


Stream<List<JP>> readJP(JP JP)=>FirebaseFirestore.instance.collection('JP').where('uid',isEqualTo: JP.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>JP.fromJson(doc.data())).toList());

Stream<List<JP>> readAllJP()=>FirebaseFirestore.instance.collection('JP').snapshots().map((snapshot) => snapshot.docs.map((doc) =>JP.fromJson(doc.data())).toList());


Future UpdateJP(JP JP) async{


final docJP = FirebaseFirestore.instance.collection('JP').doc(JP.uid);


 docJP.update({'Nom' : JP.Nom'Prenom' : JP.Prenom});

}


deleteJP(JP JP) async {
final docJP = FirebaseFirestore.instance.collection('JP').doc(JP.uid);
 docJP.delete()
}


Future<String?> AjoutJP(JP JP) async{
final docJP = FirebaseFirestore.instance.collection('JP').doc();
String path = docJP.path.split('/')[1];
JP.uid = path;
final data = JP.toJson();
docJP.set(data);
return path;
}

}