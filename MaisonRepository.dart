import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class MaisonRepository{
Stream<List<Maison>> readMaison()=>FirebaseFirestore.instance.collection('Maison').where('uid',isEqualTo: _auth.currentUser?.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>Maison.fromJson(doc.data())).toList());

Stream<List<Maison>> readAllMaison()=>FirebaseFirestore.instance.collection('Maison').snapshots().map((snapshot) => snapshot.docs.map((doc) =>Maison.fromJson(doc.data())).toList());
Future UpdateMaison(Maison Maison) async{
final docMaison = FirebaseFirestore.instance.collection('Maison').doc(Maison.id);
 docMaison.update({'Lieu' : Maison.Lieu'Date_creatio' : Maison.Date_creatio});}


deleteMaison(Maison Maison) async {
final docMaison = FirebaseFirestore.instance.collection('Maison').doc(Maison.id);
 docMaison.delete()
}


Future<String?> AjoutMaison(Maison Maison) async{
final docMaison = FirebaseFirestore.instance.collection('Maison').doc();
String path = docMaison.path.split('/')[1];
Maison.id = pathfinal data = Maison.toJson();
docMaison.set(data);
return path;
}