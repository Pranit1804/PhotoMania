import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_mania/components/single_image.dart';
import 'package:photo_mania/providers/photos.dart';
import 'package:provider/provider.dart';

class ShowImages extends StatefulWidget {
  final size;

  ShowImages(this.size);

  @override
  _ShowImagesState createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  @override
  Widget build(BuildContext context) {
    final photoData = Provider.of<Photos>(context).photoDetails;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: photoData.length != 0
          ? Container(
              height: widget.size,
              margin: EdgeInsets.all(5),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: photoData.length,
                itemBuilder: (ctx, index) => SingleImage(photoData[index]),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 20.0,
              ),
            )
          : Center(
              child: Text('Search images to see here'),
            ),
    );
  }
}
