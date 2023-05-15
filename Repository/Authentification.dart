import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locationdemaison/Model/Personne.dart';
import 'package:locationdemaison/Model/Post.dart';
import 'package:locationdemaison/Model/user.dart';


Class AuthentificationService{
final FirebaseAuth _auth = FirebaseAuth.instance;

AppUser? _userFromFireBaseUser(User? user){
return user != null ? AppUser(uid: user.uid) : null;
}

Stream<AppUser?> get user{

return _auth.authStateChanges().map(_userFromFireBaseUser);

}

Future signInWithEmailAndPassword(String email,String password) async{
try{
	_auth.authStateChanges().listen((User? user) {
	if (user == null) {
	print('User is currently signed out!');
	}else {
	print('User is signed in!');
}
});

UserCredential result =await _auth.signInWithEmailAndPassword(email: email, password: password);User? user = result.user;
return _userFromFireBaseUser(user);

}catch(exeption){print(exeption.toString());
}
}

Future registerInWithEmailAndPassword(String email,String password) async{
try{
	print('Inscription')
;_auth.authStateChanges().listen((User? user) 
{
if (user == null) {
print('User is currently signed out!');
} else 
{
print('User is signed in!');
}
});

UserCredential result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
User? user = result.user;
return _userFromFireBaseUser(user);
}
catch(exeption){
print(exeption.toString());
}

}

Future signOut() async{
try{
	return await _auth.signOut():
}catch(exeption){
print(exeption.toString());
return null;
}
}
}