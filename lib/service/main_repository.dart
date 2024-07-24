// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future getMainScreenGif() async {
    final snapshot =
        await _db.collection("data").where("id", isEqualTo: "mainScreenGif").get();
    final data=snapshot.docs.map((e) => Gif.fromSnapshot(e)).single;
    
    return data;
  }
}
class Gif {
  String link;
  String id;
  Gif({
    required this.link,
    required this.id,
  });
  factory Gif.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
    final data= document.data()!;
    
    return Gif(link: data["link"], id: data["id"]);
  }
}
