import os

# Dossier racine du projet
root_directory = "recreated_project"

# Définition des dossiers
folders = {
    "Model": os.path.join(root_directory, "Model"),
    "Repository": os.path.join(root_directory, "Repository"),
    "Services": os.path.join(root_directory, "Services"),
}

# Demander le nom de la classe principale
print("\n🔹 Entrez le nom de la classe principale utilisée dans le projet (ex: Note, Task, Message, etc.)")
class_name = input("👉 Nom de la classe (laisser vide pour 'Note') : ").strip()
if not class_name:
    class_name = "Note"

# Demander les attributs de la classe
print("\n🛠️ Maintenant, définissons les attributs de la classe.")
attributes = {}
while True:
    attr_name = input("👉 Nom de l'attribut (laisser vide pour arrêter) : ").strip()
    if not attr_name:
        break
    attr_type = input(f"👉 Type de {attr_name} (ex: String, int, bool, double) : ").strip()
    attributes[attr_name] = attr_type

# Générer le code des attributs
attributes_code = "\n".join([f"  {attr_type} {attr};" for attr, attr_type in attributes.items()])
constructor_params = ", ".join([f"required this.{attr}" for attr in attributes])
toJson_code = "\n".join([f"      '{attr}': {attr}," for attr in attributes])
fromJson_code = ", ".join([f"{attr}: json['{attr}']" for attr in attributes])

# Contenu des fichiers
files_content = {
    os.path.join(folders["Model"], f"{class_name}.dart"): f"""import 'package:cloud_firestore/cloud_firestore.dart';
class {class_name} {{
  String uid;
{attributes_code}

  {class_name}({{required this.uid, {constructor_params}}});

  Map<String, dynamic> toJson() {{
    return {{
      'uid': uid,
{toJson_code}
    }};
  }}

  static {class_name} fromJson(Map<String, dynamic> json) => {class_name}(
    uid: json['uid'],
    {fromJson_code}
  );
}}""",

    os.path.join(folders["Model"], "user.dart"): """class AppUser{
  String uid;
  AppUser({required this.uid});
}""",

    os.path.join(folders["Services"], "Authentification.dart"): """import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locationdemaison/Model/user.dart';

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFireBaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> getCurrentUser {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}""",

    os.path.join(folders["Repository"], f"{class_name}Repository.dart"): f"""import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locationdemaison/Model/{class_name}.dart';

class {class_name}Repository {{

  Future<{class_name}?> read{class_name}(String uid) async {{
    final doc{class_name} = FirebaseFirestore.instance.collection('{class_name}').doc(uid);
    final snapshot = await doc{class_name}.get();
    if(snapshot.exists) {{
        return {class_name}.fromJson(snapshot.data()!);
    }}
    return null;
  }}

  Stream<List<{class_name}>> readAll{class_name}s() {{
    return FirebaseFirestore.instance.collection('{class_name}')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => {class_name}.fromJson(doc.data())).toList());
  }}

  Future<void> update{class_name}({class_name} {class_name.lower()}) async {{
    final doc{class_name} = FirebaseFirestore.instance.collection('{class_name}').doc({class_name.lower()}.uid);
    await doc{class_name}.update({{ {', '.join([f"'{attr}': {class_name.lower()}.{attr}" for attr in attributes])} }});
  }}

  Future<void> delete{class_name}(String uid) async {{
    final doc{class_name} = FirebaseFirestore.instance.collection('{class_name}').doc(uid);
    await doc{class_name}.delete();
  }}

  Future<String?> add{class_name}({class_name} {class_name.lower()}) async {{
    final doc{class_name} = FirebaseFirestore.instance.collection('{class_name}').doc();
    {class_name.lower()}.uid = doc{class_name}.id;
    await doc{class_name}.set({class_name.lower()}.toJson());
    return doc{class_name}.id;
  }}
}}"""
}

# Création des dossiers
for folder in folders.values():
    os.makedirs(folder, exist_ok=True)

# Menu interactif pour modifier les fichiers
print("\n📌 Bienvenue dans le générateur de fichiers Dart !")
print("Vous pouvez modifier le contenu avant de générer les fichiers.\n")

for file_path, content in files_content.items():
    print(f"\n🔹 {os.path.basename(file_path)} :")
    print("1️⃣ Conserver le contenu par défaut")
    print("2️⃣ Modifier le contenu")

    choix = input("👉 Faites votre choix (1 ou 2) : ")

    if choix == "2":
        print("\n💡 Tapez votre nouveau contenu (puis appuyez sur Entrée pour enregistrer) :")
        print("Astuce : Tapez 'FIN' sur une ligne seule pour terminer l'édition.")
        new_content = []
        while True:
            line = input()
            if line.strip().upper() == "FIN":
                break
            new_content.append(line)
        files_content[file_path] = "\n".join(new_content)

# Création des fichiers avec le contenu sélectionné
for file_path, content in files_content.items():
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)

print(f"\n✅ Tous les fichiers ont été générés dans '{root_directory}' avec la classe '{class_name}' et ses attributs ! 🚀")
