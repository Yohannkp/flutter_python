import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class YohannRepository{


Stream<List<Yohann>> readYohann(Yohann Yohann)=>FirebaseFirestore.instance.collection('Yohann').where('uid',isEqualTo: Yohann.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>Yohann.fromJson(doc.data())).toList());

Stream<List<Yohann>> readAllYohann()=>FirebaseFirestore.instance.collection('Yohann').snapshots().map((snapshot) => snapshot.docs.map((doc) =>Yohann.fromJson(doc.data())).toList());


Future UpdateYohann(Yohann Yohann) async{


final docYohann = FirebaseFirestore.instance.collection('Yohann').doc(Yohann.uid);


 docYohann.update({'Produit' : Yohann.Produit});

}


deleteYohann(Yohann Yohann) async {
final docYohann = FirebaseFirestore.instance.collection('Yohann').doc(Yohann.uid);
 docYohann.delete()
}


Future<String?> AjoutYohann(Yohann Yohann) async{
final docYohann = FirebaseFirestore.instance.collection('Yohann').doc();
String path = docYohann.path.split('/')[1];
Yohann.uid = pathfinal data = Yohann.toJson();
docYohann.set(data);
return path;
}

}