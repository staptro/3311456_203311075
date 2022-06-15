import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class adBooks extends StatefulWidget {
  const adBooks({Key? key}) : super(key: key);

  @override
  State<adBooks> createState() => _adBooksState();
}

class _adBooksState extends State<adBooks> {
  var addBookName = TextEditingController();
  var addAuthorName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Books"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Card(
                child: TextField(
                  controller: addBookName,
                  style: TextStyle(fontSize: 30),
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "Enter Book Name",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Card(
                child: TextField(
                  controller: addAuthorName,
                  style: TextStyle(fontSize: 30),
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "Enter Writer Name",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  final BookName = addBookName.text;
                  final AuthorName = addAuthorName.text;
                  if (BookName == "" && AuthorName == "") {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("Alert!!"),
                        content: Text('Please fill the areas'),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    createBookName(BookName: BookName, AuthorName: AuthorName);
                    Navigator.pop(context);
                  }
                },
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createBookName({required String BookName, required AuthorName}) async {
    final docBook = FirebaseFirestore.instance.collection("Books").doc();

    final Book = Books(
      id: docBook.id,
      BookName: BookName,
      AuthorName: AuthorName,
    );
    final json = Book.toJson();

    await docBook.set(json);
  }
}

class Books {
  final String id;
  final String BookName;
  final String AuthorName;

  Books({required this.id, required this.BookName, required this.AuthorName});

  Map<String, dynamic> toJson() => {
        "id": id,
        "BookName": BookName,
        "AuthorName": AuthorName,
      };
  static Books fromJson(Map<String, dynamic> json) => Books(
      id: json['id'],
      BookName: json["BookName"],
      AuthorName: json["AuthorName"]);
}
