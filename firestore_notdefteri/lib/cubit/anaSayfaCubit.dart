import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_notdefteri/model/Notes.dart';
import 'package:firestore_notdefteri/repo/NotesRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfaCubit extends Cubit<List<Notes>>{
  AnaSayfaCubit():super(<Notes>[]){
  notlariYuke();
  }


  var collectionNotlar=FirebaseFirestore.instance.collection("notes");

  var krepo = NotesRepo();




  void notlariYuke() async {
    collectionNotlar.snapshots().listen((event) {
      var notlarListesi=<Notes>[];

      var documents=event.docs;
      for(var document in documents){
        var key=document.id;
        var data=document.data();

        var not=Notes.fromJson(data, key);
        notlarListesi.add(not);
      }
      emit(notlarListesi);
    });
  }

  Future<void>aramaYap(String aramaKelimesi)async{
    collectionNotlar.snapshots().listen((event) {
      var notlarListesi=<Notes>[];
      var documents=event.docs;
      for(var document in documents){
        var key=document.id;
        var data=document.data();

        var not=Notes.fromJson(data, key);

        if(not.title.toLowerCase().contains(aramaKelimesi.toLowerCase())){
          notlarListesi.add(not);
        }
      }
      emit(notlarListesi);
    });
  }

 Future<void>notlariKaydet(String title,String content)async{
  await krepo.Kaydet(title, content);
 }

 Future<void>notlariGuncelle(Notes notes,String title,String content)async{
    await krepo.guncelle(notes.id, title, content);
 }

 Future<void>notlariSil(String id)async{
    await krepo.sil(id);
 }
}