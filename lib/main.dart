import 'package:flutter/material.dart';
import 'package:photo_mania/providers/photos.dart';
import 'package:photo_mania/screens/detail_screen.dart';
import 'package:photo_mania/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Photos(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Mania',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
        routes: {
          DetailScreen.routeName: (ctx) => DetailScreen(),
        },
      ),
    );
  }
}
