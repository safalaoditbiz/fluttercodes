import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grid_staggered_lite/grid_staggered_lite.dart';
import 'package:transparent_image/transparent_image.dart';

class exampl extends StatefulWidget {
  const exampl({super.key});

  @override
  State<exampl> createState() => _examplState();
}

class _examplState extends State<exampl> {
  List<String> listImages = [
    "https://designhooks.com/wp-content/uploads/2018/07/Cosmetics_Preview1-1.jpg",
    "http://www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy-flower.jpg",
    "http://www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy-flower.jpg",
    "http://www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy-flower.jpg",
    "http://www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy-flower.jpg",
    "http://www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy-flower.jpg",
    "http://www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy-flower.jpg",
    //www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy- flower.jpg",
    // www.photos-public-domain.com/wp-content/uploads/2011/08/orange-poppy- flower.jpg",
    // "https:images.unsplash.com/photo-1572537165377-627a37043464?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1572204292164-b35ba943fca7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1590254553792-7e91903c5357?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1548586196-aa5803b77379?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1572447454458-e68d82f828b3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODd8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1572204304559-b5f5380482c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA4fHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1554516829-a3fce6ddbc6e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQzfHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1563642421748-5047b6585a4a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY2fHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    // "https:images.unsplash.com/photo-1593439147804-c6c7656530ae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzUzfHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Staggered GridView Sample")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StaggeredGridView.countBuilder(
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            itemCount: listImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: listImages[index],
                      fit: BoxFit.cover),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.4 : 1.9);
            }),
      ),
    );
  }
}
