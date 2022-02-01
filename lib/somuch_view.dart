
import 'package:flutter/material.dart';
import 'package:smtd/botNavBar.dart';
import 'package:smtd/views/music/miniplayer.dart';
import 'common/colors.dart';
import 'views/music/playlist_view.dart';
import 'package:miniplayer/miniplayer.dart';
import 'views/music_tab.dart';
import 'botNavBar.dart';

class Somuch extends StatefulWidget {
  const Somuch({ Key? key }) : super(key: key);

  @override
  _SomuchState createState() => _SomuchState();
}

class _SomuchState extends State<Somuch> {
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
     
        bottomNavigationBar: BottomNav(),
      
        backgroundColor: primaryColor,
     
      
        
      ),
    );
  }
}

