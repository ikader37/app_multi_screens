import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget{
  final String title;

  SectionTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(this.title,
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
    color: Colors.blueAccent
    ),
    );
  }

}