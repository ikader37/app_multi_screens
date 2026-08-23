import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton  extends StatelessWidget{
  final String text;
   // final VoidCallback onPressed;


  PrimaryButton({required this.text});
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      child: ElevatedButton(onPressed: null, child: Text(text)
      ),
      height: 50,
      width: double.infinity,

    );
  }
  
}