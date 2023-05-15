import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class GameRepository{
Stream<List<Game>> readGame()=>FirebaseFirestore.instance.collection('Game').where('uid',isEqualTo: _auth.currentUser?.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>Game.fromJson(doc.data())).toList());

Stream<List<Game>> readAllGame()=>FirebaseFirestore.instance.collection('Game').snapshots().map((snapshot) => snapshot.docs.map((doc) =>Game.fromJson(doc.data())).toList());
Future UpdateGame(Game Game) async{
final docGame = FirebaseFirestore.instance.collection('Game').doc(Game.id);
 docGame.update({'Titre' : Game.Titre'DateDébut' : Game.DateDébut'Datefin' : Game.Datefin});}


deleteGame(Game Game) async {
final docGame = FirebaseFirestore.instance.collection('Game').doc(Game.id);
 docGame.delete()
}


Future<String?> AjoutGame(Game Game) async{
final docGame = FirebaseFirestore.instance.collection('Game').doc();
String path = docGame.path.split('/')[1];
Game.id = pathfinal data = Game.toJson();
docGame.set(data);
return path;
}

}