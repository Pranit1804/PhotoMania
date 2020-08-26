import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_mania/components/search_box.dart';
import 'package:photo_mania/components/show_images.dart';
import 'package:photo_mania/providers/photos.dart';
import 'package:photo_mania/providers/temp_data.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 227, 227, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SearchBox(height * 0.065),
                SizedBox(
                  height: 2,
                ),
               ShowImages(height * 0.80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
