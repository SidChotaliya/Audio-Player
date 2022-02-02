import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:smtd/model/myaudio.dart';
import 'package:provider/provider.dart';
import 'package:smtd/common/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({ Key? key }) : super(key: key);

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  bool isPausedState = false;
  Future<bool> _willPopCallback() async {
 
  // await showDialog or Show add banners or whatever
  // then
  return true; // return true if the route to be popped
}

  @override
  Widget build(BuildContext context) {
    String urlimg='https://googleflutter.com/sample_image.jpg';
    return  MiniplayerWillPopScope(
      onWillPop: ()=>(_willPopCallback()),
      child: Miniplayer(
        
        minHeight: 100,
        maxHeight: 570,
        // backgroundColor: Colors.black87,
        
        builder: (height, percentage) {
          
          return Container(

            color: Colors.black87,
            child: Flexible(
              flex: 1,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 30,),
                 Flexible(
                   flex: 3,
                   child: Container(
                    width: 200,
                     height: 200,
                      decoration: BoxDecoration(
                         shape: BoxShape.circle,
                                image: DecorationImage(
                                image: NetworkImage(urlimg),
                                fit: BoxFit.fill
                             ),
                             ),
                           ),
                 ),
    
      Consumer<MyAudio>(
              builder: (_,myAudioModel,child)=> Slider
              (value:myAudioModel.currentDuration == null ? 0 : myAudioModel.currentDuration.inMilliseconds.toDouble(), onChanged:(value){
              myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));
    
              }, 
              min: 0,
              max: myAudioModel.totalDuration == null ? 20 : myAudioModel.totalDuration.inMilliseconds.toDouble(),
              thumbColor: darkprimary,
              inactiveColor: Colors.white54,
              activeColor: green,
               ),
            ),
    
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Consumer<MyAudio>(
                        builder: (_, myAudioModel,child)=>
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              myAudioModel.prevaudio();
                            });
                          },
                          child: Container(
                                  margin: EdgeInsets.all(10),
                                  
                                  child: Center(child: Icon(Icons.skip_previous, color: Colors.black38,)),
                                ),
                        ),
                      ),
                    ),
                    Container(
                    
                height: 60,
                width: 60,
                
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape:BoxShape.circle, boxShadow:[BoxShadow(
                    color: Colors.black.withOpacity(0.4), 
                    offset: Offset(5,10),
                    spreadRadius: 3,
                    blurRadius: 20
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20)
                    ]),
                    
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle,
                            boxShadow: [BoxShadow(
                                 color: Colors.black.withOpacity(0.4), 
                                 offset: Offset(5,10),
                                 spreadRadius: 3,
                                 blurRadius: 20
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20)
                    ],
                            ), 
                            
                          ),
                        ),
                        Center(
                          child: Flexible(
                            flex: 1,
                            child: Consumer<MyAudio>(
                              builder: (_,myAudioModel,child)=>
                               GestureDetector(
                                 onTap: (){
                                    print("Tap");
                                    setState(() {
                                  if(myAudioModel.audioState=="Playing"){
                                      myAudioModel.pauseaudio();
                                      this.isPausedState= true;
                                      }
                                 else{
                                     myAudioModel.playaudio();
                                     this.isPausedState=false;
                                     }
                                 });
          // myAudioModel.audioState=="Playing"? myAudioModel.pauseaudio()   : myAudioModel.playaudio();
       
    
                                 },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: green,shape: BoxShape.circle), 
                                  child: Center(child: Icon(myAudioModel.audioState=="Playing"? Icons.pause : Icons.play_arrow)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                      ),
                 Flexible(
                   flex: 1,
                   child: Consumer<MyAudio>(
                     builder: (_,myAudioModel,child)=>
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            myAudioModel.nextaudio();
                          });
                        },
                       child: Container(
                                  margin: EdgeInsets.all(10),
                                  
                                  child: Center(child: Icon(Icons.skip_next, color: Colors.black38,)),
                                ),
                     ),
                   ),
                 ),
                          
                  ],
                ),
              )
            
            
                ],
              ),
            ),
          );
        },
      
         
        
      ),
    );
  }
}