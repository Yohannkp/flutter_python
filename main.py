#Creation de classes
import os;

try:
    os.mkdir("Model")
    os.mkdir("Repository")
except:
     print("Dossier déjà existant")

print("Entrer le nom de votre classe")
nom_classe = input()
print("Combien d'attributs avez vous ?")
nombre_attributs = int(input())
attributs = ["id","uid"]
for i in range(0,nombre_attributs):
    attribut = input("Entrer le premier attribut")
    attributs.append(attribut)
print(attributs[0])
with open('Model/{}.dart'.format(nom_classe), 'w') as f:
    f.write("import 'package:cloud_firestore/cloud_firestore.dart';\nclass {} {}".format(nom_classe,"{\n"))
with open('Model/{}.dart'.format(nom_classe),'a') as g:
            for i in range(0,len(attributs)):
                   g.write(" String ")
                   g.write(attributs[i])
                   g.write(";\n")
            g.write("{}({}".format(nom_classe,"{"))
            for i in range(0,len(attributs)): 
                g.write("required this.")
                g.write(attributs[i])
                g.write(",")
            g.write("});")
            g.write("\n\n")
            g.write("Map<String, dynamic> toJson(){\nreturn{\n")
            for i in range(0,len(attributs)):
                g.write("'{}' : {} ,\n".format(attributs[i],attributs[i]))
            g.write("};")

            g.write("}")
            g.write("\n")
            g.write("static {} fromJson(Map<String,dynamic> json) => {}(".format(nom_classe,nom_classe))
            for i in range(0,len(attributs)):
                  g.write("{}: json['{}'],".format(attributs[i],attributs[i]))
            g.write(");")
            g.write("\n\n")
            g.write("}")

#Creer le repository

nomRpository = "{}Repository".format(nom_classe)
nomFichier = "Repository/{}Repository.dart".format(nom_classe)
with open("{}".format(nomFichier),'w') as r:
      r.write("import 'dart:io';\nimport 'package:cloud_firestore/cloud_firestore.dart';\nimport 'package:firebase_auth/firebase_auth.dart';\nimport 'package:firebase_storage/firebase_storage.dart';\nimport 'package:locationdemaison/Model/Personne.dart';\nimport 'package:locationdemaison/Model/Post.dart';\nimport 'package:firebase_storage/firebase_storage.dart';\nimport 'package:path/path.dart' as Path;\nclass {}".format(nomRpository))
      r.write("{")
      r.write("\nStream<List<{}>> read{}()=>FirebaseFirestore.instance.collection('{}').where('uid',isEqualTo: _auth.currentUser?.uid).snapshots().map((snapshot) => snapshot.docs.map((doc) =>{}.fromJson(doc.data())).toList());".format(nom_classe,nom_classe,nom_classe,nom_classe))
      r.write("\n")
      r.write("\nStream<List<{}>> readAll{}()=>FirebaseFirestore.instance.collection('{}').snapshots().map((snapshot) => snapshot.docs.map((doc) =>{}.fromJson(doc.data())).toList());\n".format(nom_classe,nom_classe,nom_classe,nom_classe))
      r.write("Future Update{}({} {}) async".format(nom_classe,nom_classe,nom_classe))
      r.write("{\n")
      r.write("final doc{} = FirebaseFirestore.instance.collection('{}').doc({}.id);".format(nom_classe,nom_classe,nom_classe))
      r.write("\n doc{}.update(".format(nom_classe))
      r.write("{")
      for i in range(2,nombre_attributs+2):
        r.write("'{}' : {}.{}".format(attributs[i],nom_classe,attributs[i]))
      r.write("}")
      r.write(");")
      r.write("}")
      r.write("\n\n\n")

      r.write("delete{}({} {}) async ".format(nom_classe,nom_classe,nom_classe))
      r.write("{")
      r.write("\nfinal doc{} = FirebaseFirestore.instance.collection('{}').doc({}.id);".format(nom_classe,nom_classe,nom_classe))
      r.write("\n doc{}.delete()".format(nom_classe))
      r.write("\n}")

      r.write("\n\n\n")

      r.write("Future<String?> Ajout{}({} {}) async".format(nom_classe,nom_classe,nom_classe))
      r.write("{\n")
      r.write("final doc{} = FirebaseFirestore.instance.collection('{}').doc();\n".format(nom_classe,nom_classe))
      r.write("String path = doc{}.path.split('/')[1];\n".format(nom_classe))
      r.write("{}.id = path".format(nom_classe))
      r.write("final data = {}.toJson();\n".format(nom_classe))
      r.write("doc{}.set(data);\nreturn path;".format(nom_classe))
      r.write("\n}\n\n")
      r.write("}")