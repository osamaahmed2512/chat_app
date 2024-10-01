import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
    custombutton({this.ontap, super.key, required this.text});
  final String text ;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
               child: Center(child: Text(text)),
              width: double.infinity,
              height: 50,
              decoration:  BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(8),
              ),
              
              ),
    );
  }
}