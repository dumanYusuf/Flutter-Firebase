import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesRepo{

  var collectionKisiler=FirebaseFirestore.instance.collection("notes");

  Future<void> Kaydet(String title, String content) async {
    var notKaydet = HashMap<String, dynamic>();
    notKaydet["id"] = collectionKisiler.doc().id;
    notKaydet["title"] =title ;
    notKaydet["content"] = content;
    await collectionKisiler.add(notKaydet);
  }

  Future<void>guncelle(String id,String title,String content)async{
    var notGuncelle = HashMap<String, dynamic>();
    notGuncelle["title"] =title ;
    notGuncelle["content"] = content;
    await collectionKisiler.doc(id).update(notGuncelle);
  }

  Future<void>sil(String id)async{
    collectionKisiler.doc(id).delete();
}
}