import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class PersonneRepository{
Stream<List<Personne>> readPersonne()=>FirebaseFirestore.instance.collection('Personne').where('uid',isEqualTo: _auth.currentUser?.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>Personne.fromJson(doc.data())).toList());

Stream<List<Personne>> readAllPersonne()=>FirebaseFirestore.instance.collection('Personne').snapshots().map((snapshot) => snapshot.docs.map((doc) =>Personne.fromJson(doc.data())).toList());
Future UpdatePersonne(Personne Personne) async{
final docPersonne = FirebaseFirestore.instance.collection('Personne').doc(Personne.id);
 docPersonne.update({'Numero_tel' : Personne.Numero_tel'Nom' : Personne.Nom'Prenom' : Personne.Prenom'Age' : Personne.Age'Sex' : Personne.Sex'Mail' : Personne.Mail'type_user' : Personne.type_user'image_profile' : Personne.image_profile'fin_abonnement' : Personne.fin_abonnement'statspaiment' : Personne.statspaiment'password' : Personne.password});}


deletePersonne(Personne Personne) async {
final docPersonne = FirebaseFirestore.instance.collection('Personne').doc(Personne.id);
 docPersonne.delete()
}


Future<String?> AjoutPersonne(Personne Personne) async{
final docPersonne = FirebaseFirestore.instance.collection('Personne').doc();
String path = docPersonne.path.split('/')[1];
Personne.id = pathfinal data = Personne.toJson();
docPersonne.set(data);
return path;
}

}