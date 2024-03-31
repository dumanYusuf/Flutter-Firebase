import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/kisiler.dart';
import '../repo/kisilerRepo.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit():super(<Kisiler>[]);

  var collectionKisiler=FirebaseFirestore.instance.collection("kişiler");

  var krepo = KisilerDaoRepository();

  //Kişileri yukle fonksiyonunu Repo da cagıramıyoruz o yuzden Cubit Sınıfında kullanıcaz
  Future<void> kisileriYukle() async {
    collectionKisiler.snapshots().listen((event) {
      var kisilerListesi=<Kisiler>[];
      var documents=event.docs;//burda dokumana erişiyorum
      for(var document in documents){
        var key=document.id;//burda key degerine
        var data=document.data();//burda data degerine ulaşıyorum
        
        var kisi=Kisiler.fromJson(data, key);
        kisilerListesi.add(kisi);
      }
      emit(kisilerListesi);//ve burda aldığım degerleri emit ediyorum
    });
  }
//Kişileri ara fonksiyonunu Repo da cagıramıyoruz o yuzden Cubit Sınıfında kullanıcaz
  Future<void> ara(String aramaKelimesi) async {
    collectionKisiler.snapshots().listen((event) {
      var kisilerListesi=<Kisiler>[];
      var documents=event.docs;//burda dokumana erişiyorum
      for(var document in documents){
        var key=document.id;//burda key degerine
        var data=document.data();//burda data degerine ulaşıyorum

        var kisi=Kisiler.fromJson(data, key);

        if(kisi.kisi_ad.toLowerCase().contains(aramaKelimesi.toLowerCase())){
          kisilerListesi.add(kisi);
        }
      }
      emit(kisilerListesi);//ve burda aldığım degerleri emit ediyorum
    });

  }

  Future<void> sil(String kisi_id) async {
    await krepo.sil(kisi_id);
  }





}