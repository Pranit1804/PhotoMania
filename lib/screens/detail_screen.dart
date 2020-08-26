import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_mania/providers/photos.dart';
import 'package:photo_mania/extensions/string_extension.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var _loading = false;

  void downloadImage(photoData) async{
    try {
      setState(() {
        _loading = true;
      });
      var imageId = await ImageDownloader.downloadImage(photoData.imageUrl);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image Downloaded'),));
      if(imageId == null){
        print('error');
      }
      else{
        var path = await ImageDownloader.findPath(imageId);
        print(path);
      }
      setState(() {
        _loading = false;
      });
    } catch (error) {
      print('error $error');
    }

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final photoData = ModalRoute.of(context).settings.arguments as Photo;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: height * 0.53,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photoData.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: height * 0.465,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(photoData.profileImage),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              photoData.userName.toString().capitalize(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            !_loading
                                ? IconButton(
                                    icon: Icon(
                                      Icons.cloud_download,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      downloadImage(photoData);
                                    },
                                  )
                                : SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          photoData.description.toString().isNotEmpty
                              ? photoData.description.toString().capitalize()
                              : 'No description available',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
