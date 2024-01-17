import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
    String folderPath = '/images';

    ListResult result = await _storage.ref(folderPath).listAll();

    List<String> urls = [];
    for (Reference ref in result.items) {
      String url = await ref.getDownloadURL();
      urls.add(url);
    }

    setState(() {
      imageUrls = urls;
    });
  }

  Future<void> deleteImage(String imageUrl) async {
    
    Reference imageRef = _storage.refFromURL(imageUrl);

    
    await imageRef.delete();

    
    fetchImageUrls();
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
              },
            ),
    );
  }
}
