class Notes {
  String id;
  String title;
  String content;

  Notes({required this.id,required this.title,required this.content});

  factory Notes.fromJson(Map<dynamic,dynamic> json,String key){
    return Notes(
        id: key,
        title: json["title"]as String,
        content: json["content"]as String
    );
  }

/* Map<String, dynamic> toMap() {
    return {
      'kisi_id': kisi_id,
      'kisi_ad': kisi_ad,
      'kisi_tel': kisi_tel,
    };
  }*/
}