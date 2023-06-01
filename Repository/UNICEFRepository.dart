import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
class UNICEFRepository{


Stream<List<UNICEF>> readUNICEF(UNICEF UNICEF)=>FirebaseFirestore.instance.collection('UNICEF').where('uid',isEqualTo: UNICEF.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>UNICEF.fromJson(doc.data())).toList());

Stream<List<UNICEF>> readAllUNICEF()=>FirebaseFirestore.instance.collection('UNICEF').snapshots().map((snapshot) => snapshot.docs.map((doc) =>UNICEF.fromJson(doc.data())).toList());


Future UpdateUNICEF(UNICEF UNICEF) async{


final docUNICEF = FirebaseFirestore.instance.collection('UNICEF').doc(UNICEF.uid);


 docUNICEF.update({'Lieu' : UNICEF.Lieu'Destination' : UNICEF.Destination});

}


deleteUNICEF(UNICEF UNICEF) async {
final docUNICEF = FirebaseFirestore.instance.collection('UNICEF').doc(UNICEF.uid);
 docUNICEF.delete()
}


Future<String?> AjoutUNICEF(UNICEF UNICEF) async{
final docUNICEF = FirebaseFirestore.instance.collection('UNICEF').doc();
String path = docUNICEF.path.split('/')[1];
UNICEF.uid = path;
final data = UNICEF.toJson();
docUNICEF.set(data);
return path;
}

}