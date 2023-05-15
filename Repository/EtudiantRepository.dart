import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class EtudiantRepository{
Stream<List<Etudiant>> readEtudiant()=>FirebaseFirestore.instance.collection('Etudiant').where('uid',isEqualTo: _auth.currentUser?.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>Etudiant.fromJson(doc.data())).toList());

Stream<List<Etudiant>> readAllEtudiant()=>FirebaseFirestore.instance.collection('Etudiant').snapshots().map((snapshot) => snapshot.docs.map((doc) =>Etudiant.fromJson(doc.data())).toList());
Future UpdateEtudiant(Etudiant Etudiant) async{
final docEtudiant = FirebaseFirestore.instance.collection('Etudiant').doc(Etudiant.id);
 docEtudiant.update({'Nom' : Etudiant.Nom'Prenom' : Etudiant.Prenom'Age' : Etudiant.Age'Sex' : Etudiant.Sex});}


deleteEtudiant(Etudiant Etudiant) async {
final docEtudiant = FirebaseFirestore.instance.collection('Etudiant').doc(Etudiant.id);
 docEtudiant.delete()
}


Future<String?> AjoutEtudiant(Etudiant Etudiant) async{
final docEtudiant = FirebaseFirestore.instance.collection('Etudiant').doc();
String path = docEtudiant.path.split('/')[1];
Etudiant.id = pathfinal data = Etudiant.toJson();
docEtudiant.set(data);
return path;
}

}