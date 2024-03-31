
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';


class KisilerDaoRepository {

  var collectionKisiler=FirebaseFirestore.instance.collection("kişiler");

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    var yeniKisi = HashMap<String, dynamic>();
    yeniKisi["kisi_id"] = "";
    yeniKisi["kisi_ad"] = kisi_ad;
    yeniKisi["kisi_tel"] = kisi_tel;
    await collectionKisiler.add(yeniKisi);
  }


  Future<void> guncelle(String kisi_id,String kisi_ad,String kisi_tel) async {
    var guncelleneKisi = HashMap<String, dynamic>();
    guncelleneKisi["kisi_id"] = "";
    guncelleneKisi["kisi_ad"] = kisi_ad;
    guncelleneKisi["kisi_tel"] = kisi_tel;
    collectionKisiler.doc(kisi_id).update(guncelleneKisi);
  }

  Future<void> sil(String kisi_id) async {
    collectionKisiler.doc(kisi_id).delete();
  }


}

