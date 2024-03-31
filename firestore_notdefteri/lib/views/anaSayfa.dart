import 'package:firestore_notdefteri/cubit/anaSayfaCubit.dart';
import 'package:firestore_notdefteri/model/Notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

late TextEditingController titleController;
late TextEditingController contentController;


class _AnaSayfaState extends State<AnaSayfa> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(title: CupertinoSearchTextField(
          onChanged: (aramaSonucu){
            context.read<AnaSayfaCubit>().aramaYap(aramaSonucu);
          },
        ),),
      body: BlocBuilder<AnaSayfaCubit,List<Notes>>(
          builder: (context, notlarListesi){
            if(notlarListesi.isNotEmpty){
              return ListView.builder(
                itemCount: notlarListesi.length,
                  itemBuilder: (context, index){
                     var oankiNot=notlarListesi[index];
                     return Card(
                       elevation: 3,
                       color: Colors.yellow,
                       child: ListTile(
                         title: Text(oankiNot.title,style:const TextStyle(fontSize: 24),),
                         subtitle: Text(oankiNot.content,style:const TextStyle(fontSize: 20)),
                         trailing: SizedBox(
                           width: 100,
                           child: Row(
                             children: [
                               IconButton(
                                   onPressed: (){
                                     ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(content:Text("${oankiNot.title} Silinsin mi?"),
                                         action: SnackBarAction(
                                             label: "Evet",
                                             onPressed: (){
                                               context.read<AnaSayfaCubit>().notlariSil(oankiNot.id);

                                             }),
                                       ),

                                     );
                                   },
                                   icon:const Icon(Icons.delete)
                               ),
                               IconButton(
                                   onPressed: (){
                                     _buildGuncelle(context,oankiNot,currentName: oankiNot.title,currentContent: oankiNot.content);
                                   },
                                   icon:const Icon(Icons.edit)
                               )
                             ],
                           ),
                         ),
                       ),
                     );
                  },
              );
            }
            else{
              return const Center(child:Text("Hadi Not Ekle",style: TextStyle(fontSize:24 ),));
            }
          },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            titleController.text="";
            contentController.text="";
            _buildEkle(context);

          },
        child: Icon(Icons.add),
      ),
    );
  }

  void _buildEkle(BuildContext context) {

    showModalBottomSheet(
      isScrollControlled: true,
        context: context, 
        builder: (BuildContext context) {
          return Container(
            color: Colors.blue,
            height: 500,
            width: double.infinity,
            child: Column(
              children: [
               const Text("Not Ekle",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: titleController,
                    decoration:const InputDecoration(
                      labelText: "Başlık Ekle",
                      hintText: "Baslığı yaz"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: contentController,
                    decoration:const InputDecoration(
                        labelText: "İçerik Ekle",
                        labelStyle: TextStyle(fontSize: 20),
                        hintText: "İçeriği Yaz",
                        hintStyle: TextStyle(fontSize: 24)
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                     context.read<AnaSayfaCubit>().notlariKaydet(titleController.text, contentController.text);
                     ScaffoldMessenger.of(context).showSnackBar(
                     const  SnackBar(
                       backgroundColor: Colors.yellow,
                       duration: Duration(seconds: 2),
                         content:Text("Kaydetme işlemi başarılı",style: TextStyle(fontSize: 20),) )
                     );
                     Navigator.of(context).pop();
                    },
                    child:const Text("Kaydet"))
              ],
            ),
          );
        },
    );
  }

  void _buildGuncelle(BuildContext context,Notes notes,{String? currentContent,String? currentName}) {
    titleController = TextEditingController(text: currentName);
    contentController = TextEditingController(text: currentContent);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.blue,
          height: 500,
          width: double.infinity,
          child: Column(
            children: [
              const Text("Not Guncelle",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: titleController,
                  decoration:const InputDecoration(
                      labelText: "Başlık Ekle",
                      hintText: "Baslığı yaz"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: contentController,
                  decoration:const InputDecoration(
                      labelText: "İçerik Ekle",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "İçeriği Yaz",
                      hintStyle: TextStyle(fontSize: 24)
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){

                      context.read<AnaSayfaCubit>().notlariGuncelle(notes, titleController.text, contentController.text);


                    ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(
                            backgroundColor: Colors.grey,
                            duration: Duration(seconds: 2),
                            content:Text("Güncelleme işlemi başarılı",style: TextStyle(fontSize: 20),) )
                    );
                    Navigator.of(context).pop();
                  },
                  child:const Text("Güncelle"))
            ],
          ),
        );
      },
    );
  }
}
