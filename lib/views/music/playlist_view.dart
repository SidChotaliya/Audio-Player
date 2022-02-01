import 'package:provider/provider.dart';
import 'package:smtd/model/myaudio.dart';

import 'miniplayer.dart';

import 'package:flutter/material.dart';

class PlaylistControl extends StatelessWidget {
  const PlaylistControl({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListControl(musictxt: "Lofi : CityScape",imgurl: 'https://i.imgur.com/BbhmYlp.png',),
          SizedBox(height: 10,),
           ListControl( musictxt: " Lofi : In to the Clouds", imgurl: 'https://wallpaperaccess.com/full/642908.jpg',),
           SizedBox(height: 10,),
            ListControl(musictxt: "Lofi: Festive" ,imgurl: 'https://wallpaperdash.com/wp-content/uploads/2021/08/sad-lofi-background.jpg',)
        ],
      ),

    
    );
  }
}

class ListControl extends StatefulWidget {
  const ListControl({ Key? key, required this.imgurl, required this.musictxt }) : super(key: key);
 final String imgurl;
final String musictxt;


  @override
  State<ListControl> createState() => _ListControlState();
}

class _ListControlState extends State<ListControl> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Consumer<MyAudio>(
        builder: (_,myAudioModel,child)=>
   GestureDetector(
          onTap:(){ 
            setState(() {
             myAudioModel.playaudio();
            });
          },
          child: Container(
            height: 100,
            width: 500,
            padding: EdgeInsets.all(10),
            
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(widget.imgurl),
                fit: BoxFit.fitWidth
              ),
            ),
          
          ),
        ),
      ),
      
      Positioned.fill(
        
        child:
      Align( 
         alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
         margin: EdgeInsets.all(20),
         
          height: 30,
          width: 150,
          child: Text("  "+ widget.musictxt + "  ", style: TextStyle(backgroundColor:Colors.white.withOpacity(0.2),color: Colors.white)),
          // decoration: BoxDecoration(
           
          //   borderRadius: BorderRadius.all(Radius.circular(20)),
          //   color: Colors.white.withOpacity(0.2),
           
          // ),
        ),
      )),
      ]);
  }
}