import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/insidePages/books/insideBooks/addBooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  String defaultText = "";
  var UpdateBookName = TextEditingController();
  var UpdateAuthorName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => adBooks()),
                  );
                },
                icon: Icon(Icons.add))
          ],
          centerTitle: true,
          title: Text("Books"),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder<List<Books>>(
          stream: readBooks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong! : ${snapshot.error}");
            } else if (snapshot.hasData) {
              final books = snapshot.data!;
              return ListView(children: books.map(buildBooks).toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget buildBooks(Books books) => Slidable(
        endActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              FirebaseFirestore.instance
                  .collection('Books')
                  .doc(books.id)
                  .delete();
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              onPressed: (BuildContext context) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    insetPadding:
                        EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                    title: Text("Change Names"),
                    content: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 30),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Book Name",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                          controller: UpdateBookName,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$defaultText",
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 30),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Author Name",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                          controller: UpdateAuthorName,
                        )
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          if (UpdateBookName.text == "" ||
                              UpdateAuthorName.text == "") {
                            return Navigator.pop(context);
                          } else
                            FirebaseFirestore.instance
                                .collection('Books')
                                .doc(books.id)
                                .update({
                              "id": books.id,
                              'BookName': '${UpdateBookName.text}',
                              'AuthorName': '${UpdateAuthorName.text}'
                            });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              })
        ]),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          leading: Icon(
            Icons.book_sharp,
            color: Colors.white,
            size: 50,
          ),
          title: Text(
            books.BookName,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          subtitle: Text(
            books.AuthorName,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      );

  Stream<List<Books>> readBooks() => FirebaseFirestore.instance
      .collection("Books")
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => Books.fromJson(doc.data())).toList());
}
