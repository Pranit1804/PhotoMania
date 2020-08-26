import 'package:flutter/material.dart';
import 'package:photo_mania/providers/photos.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  final size;
  SearchBox(this.size);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {

  final _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Search images',
                    hintStyle: TextStyle(
                        color: Colors.black54,
                      fontSize: 14
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search, size: 17,),
              color: Colors.black54,
              onPressed: () {
                final searchText = _controller.text;
                Provider.of<Photos>(context, listen: false).getPhotos(searchText, context);
                print('text: $searchText');
              },
            )
          ],
        ),
      ),
    );
  }
}
