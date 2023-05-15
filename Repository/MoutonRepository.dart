import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class MoutonRepository{


Stream<List<Mouton>> readMouton()=>FirebaseFirestore.instance.collection('Mouton').where('uid',isEqualTo: _auth.currentUser?.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>Mouton.fromJson(doc.data())).toList());

Stream<List<Mouton>> readAllMouton()=>FirebaseFirestore.instance.collection('Mouton').snapshots().map((snapshot) => snapshot.docs.map((doc) =>Mouton.fromJson(doc.data())).toList());


Future UpdateMouton(Mouton Mouton) async{


final docMouton = FirebaseFirestore.instance.collection('Mouton').doc(Mouton.id);


 docMouton.update({'nom' : Mouton.nom'prenom' : Mouton.prenom});

}


deleteMouton(Mouton Mouton) async {
final docMouton = FirebaseFirestore.instance.collection('Mouton').doc(Mouton.id);
 docMouton.delete()
}


Future<String?> AjoutMouton(Mouton Mouton) async{
final docMouton = FirebaseFirestore.instance.collection('Mouton').doc();
String path = docMouton.path.split('/')[1];
Mouton.id = pathfinal data = Mouton.toJson();
docMouton.set(data);
return path;
}

}