import 'package:flutter/material.dart';
import 'package:photo_mania/providers/photos.dart';
import 'package:photo_mania/screens/detail_screen.dart';

class SingleImage extends StatelessWidget {

  final Photo photo;

  const SingleImage(this.photo);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: photo);
      },
      child: Hero(
        tag: photo.imageUrl,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(photo.imageUrl),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
