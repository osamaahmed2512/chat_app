import 'package:chat_app_last/helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

// ignore: must_be_immutable
class registerPage extends StatefulWidget {
  registerPage({super.key});
  static String id = "registerpage";

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: const Color(0xff274460),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  "assets/images/scholar.png",
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "scolar chat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
                const Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                customTextField(
                  onchanged: (data) {
                    email = data;
                  },
                  hintText: "email",
                ),
                const SizedBox(
                  height: 12,
                ),
                customTextField(
                  onchanged: (data) {
                    password = data;
                  },
                  hintText: "password",
                ),
                const SizedBox(
                  height: 20,
                ),
                custombutton(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading=true;
                      setState(() {
                        
                      });
                      try {
                        await RegisterUser();
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          Showsnackbar(context, 'weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          Showsnackbar(context, 'email-already-in-use');
                        } else {
                          Showsnackbar(context, ex.toString());
                        }
                      }
                      isloading=false;
                      setState(() {
                        
                      });
                    }
                  },
                  text: 'Register',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account ? ",
                      style: TextStyle(color: Color(0xffC7EDE6)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> RegisterUser() async {
    // ignore: unused_local_variable
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
