import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      print("Navigating to ImageListView");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ImageListView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}

class ImageListView extends StatefulWidget {
  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    try {
      String folderPath = '/images';

      print("Fetching image URLs from $folderPath");

      ListResult result = await _storage.ref(folderPath).listAll();

      List<String> urls = [];
      for (Reference ref in result.items) {
        String url = await ref.getDownloadURL();
        urls.add(url);
      }

      print("Fetched ${urls.length} image URLs");

      setState(() {
        imageUrls = urls;
      });
    } catch (e) {
      print('Error fetching image URLs: $e');
    }
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      Reference imageRef = _storage.refFromURL(imageUrl);

      print("Deleting image at $imageUrl");

      await imageRef.delete();

      print("Image deleted, fetching updated image URLs");
      fetchImageUrls();
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageUrls.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                try {
                  return ListTile(
                    title: Image.network(
                      imageUrls[index],
                      width: 100.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Delete Image?'),
                            content: Text('Do you want to delete this image?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  print("User confirmed deletion");
                                  deleteImage(imageUrls[index]);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                } catch (e) {
                  print('Error loading image: $e');
                  return Container(); // or some placeholder widget
                }
              },
            ),
    );
  }
}
