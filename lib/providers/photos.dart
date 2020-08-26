import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Photo {
  final imageUrl;
  final description;
  final userName;
  final profileImage;

  Photo({this.imageUrl, this.description, this.userName, this.profileImage});
}

class Photos with ChangeNotifier {
  final API_KEY = "r9X-VFBm8waRmAFLuvRI0crD5E-skJHhVF8th1tnnjY";

  List<Photo> _photoDetails = new List();

  Future getPhotos(String searchText, context) async {
    try {
      _photoDetails.clear();
      final url =
          "https://api.unsplash.com/search/photos?page=1&query=$searchText&client_id=$API_KEY";
      print(url);
      http.Response response = await http.get(url);
      final data = json.decode(response.body);
      final photos = data['results'];
      for (int i = 0; i < photos.length; i++) {
        _photoDetails.add(Photo(
            imageUrl: photos[i]['urls']['small'],
            description: photos[i]['alt_description'],
            userName: photos[i]['user']['username'],
            profileImage: photos[i]['user']['profile_image']['large']));
        print('Test: ${photos[i]['user']['profile_image']['large']}');
      }
      notifyListeners();
    } catch (error) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Something Wrong happened'),
      ));
    }
  }

  List<Photo> get photoDetails {
    return _photoDetails;
  }
}
