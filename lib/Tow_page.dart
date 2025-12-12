
import 'package:flutter/material.dart';

class Towpage extends StatelessWidget {
  final String name;
  Towpage({super.key,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Tow Page'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(name , style: TextStyle(
          fontSize: 25,
          fontWeight:FontWeight.bold
        ),),
      ),
    );
  }
}