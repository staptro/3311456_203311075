import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApp extends StatelessWidget {
  FirestoreApp({Key? key}) : super(key: key);

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    debugPrint(_firestore.collection("users").id);
    debugPrint(_firestore.collection("users").doc().id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Firestore Applications"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  veriEklemeAdd();
                },
                child: Text("Veri Ekle Add"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  veriEklemeSet();
                },
                child: Text("Veri Ekle Set"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                onPressed: () {
                  veriGuncelleme();
                },
                child: Text("Veri Guncelleme"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  veriSilme();
                },
                child: Text("Veri Silme"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                onPressed: () {},
                child: Text("Veri Oku One Time"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void veriEklemeAdd() async {
    Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
    _eklenecekUser["name"] = "Serhat";
    _eklenecekUser["age"] = 21;

    await _firestore.collection("users").add(_eklenecekUser);
  }

  void veriEklemeSet() async {
    var _newDocID = _firestore.collection("users").doc().id;

    await _firestore
        .doc("users/$_newDocID")
        .set({"name": "Ali", "userID": "$_newDocID"});
    await _firestore.doc("users/wjNwyLamDsK6xnx4uQB9").set(
        {"name": "serhat", "age": 34, "okul": "Selcuk"},
        SetOptions(merge: true));
  }

  void veriGuncelleme() async {
    await _firestore
        .doc("users/wjNwyLamDsK6xnx4uQB9")
        .update({"okul": "guncel selcuk"});
  }

  void veriSilme() async {
    await _firestore.doc("users/wjNwyLamDsK6xnx4uQB9").delete();
  }

  void veriOkumaOneTime() async {
    var _usersDocument = await _firestore.collection("users").get();
    debugPrint(_usersDocument.size.toString());
  }
}
