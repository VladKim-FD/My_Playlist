import 'package:flutter/material.dart';
import 'package:my_playlist_app/my_playlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyPlaylist(),
    );
  }
}


