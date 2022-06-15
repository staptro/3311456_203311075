import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhotoPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.png',
    'assets/5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Photo"),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: true,
          ),
          items: imageList
              .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        e,
                        width: 1000,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    ],
                  )))
              .toList(),
        ),
      ),
    ));
  }
}
