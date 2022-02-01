import 'package:flutter/material.dart';
import 'package:smtd/views/music_tab.dart';
import 'package:smtd/views/settings.dart';
import 'package:smtd/views/teatime.dart';
import 'package:smtd/views/todo.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

 int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _children = <Widget>[
    // Text(
    //   'Index 0: Home',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 1:'  ,
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 2: cup',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 3: Settings',
    //   style: optionStyle,
    // ),
Todo(),
MusicTab(),
TeaTime(),
Settings(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _children[_selectedIndex],
      bottomNavigationBar : BottomNavigationBar(
           // this will be set when a new tab is tapped
         items: [
           BottomNavigationBarItem(
             backgroundColor: Colors.black,
             icon: new Icon(Icons.check_circle_outline,color: Colors.greenAccent,),
             title: new Text(''),
             
           ),
           BottomNavigationBarItem(
             backgroundColor: Colors.black,
             
             icon: new Icon(Icons.audiotrack,color: Colors.greenAccent,),
             title: new Text(''),
           ),
           BottomNavigationBarItem(
             backgroundColor: Colors.black,
             icon: Icon(Icons.emoji_food_beverage_rounded,color: Colors.greenAccent,),
             title: Text('')
           ),
           BottomNavigationBarItem(
             backgroundColor: Colors.black,
             icon: Icon(Icons.settings,color: Colors.greenAccent,),
             title: Text('')
           )
         ],
            currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          
    
          
       ),
    );
     
  }
}
