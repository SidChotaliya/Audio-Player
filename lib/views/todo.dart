import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://cdn.wallpapersafari.com/68/99/r9UYB8.jpg'),
          ),
        ),
      ),
      Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            Text(
              "ToDo",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ]));
  }
}
