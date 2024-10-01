import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
   customTextField({super.key, this.hintText , this.onchanged,this.obsecuretext=false});
  final String? hintText;
      final  Function(String)? onchanged;
      final bool? obsecuretext;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
            obscureText: obsecuretext!,
            validator: (value) {
              if (value!.isEmpty) {
                return "field is required ";
              }
              return null;
            },
            onChanged:onchanged ,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ) ,
              border:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
              ),
            ),
          );
  }
}