import 'package:flutter/material.dart';
import 'music/miniplayer.dart';
import 'music/playlist_view.dart';

class MusicTab extends StatefulWidget {
  const MusicTab({ Key? key }) : super(key: key);

  @override
  _MusicTabState createState() => _MusicTabState();
}

class _MusicTabState extends State<MusicTab> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
          children:[ 
             Container(
                 width: double.infinity,
                 height: double.infinity,
                 decoration: BoxDecoration(
                 image: DecorationImage(
                 fit: BoxFit.fitHeight,
                 image: NetworkImage('https://cdn.wallpapersafari.com/68/99/r9UYB8.jpg'),
      ),
    ),
             ),
            
            Column(
            children: [
              SizedBox(height:90),
              Text("Sounds", textAlign: TextAlign.left,style: TextStyle(color: Colors.white60,fontSize: 45, fontWeight: FontWeight.bold, ),),
              Text("Immersive Playlist",textAlign: TextAlign.right ,style: TextStyle(color: Colors.greenAccent,fontSize: 40,fontWeight: FontWeight.bold),),
              PlaylistControl(),
            ],
          ),
          MiniPlayer()
           
          ]
        );
    
  }
}