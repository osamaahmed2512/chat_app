import 'package:chat_app_last/constans.dart';
import 'package:chat_app_last/helper/show_snack_bar.dart';
import 'package:chat_app_last/pages/chat_page.dart';
import 'package:chat_app_last/pages/register_page.dart';
import 'package:chat_app_last/widgets/custom_button.dart';
import 'package:chat_app_last/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class loginpage extends StatefulWidget {
  loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isloading ,
      child: Scaffold(
        backgroundColor: KPrimaryColour,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                // const Spacer(flex: 2,),
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
                //  const Spacer(flex: 1,),
                const Row(
                  children: [
                    Text(
                      "LOGIN",
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
                  hintText: "email",
                  onchanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                customTextField(
                  obsecuretext: true,
                  hintText: "password",
                  onchanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     "login",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: Color(0xff274460).withOpacity(0.1),
                //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                // ),
                custombutton(
                  text: 'login',
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {
                        
                      });
                      try {
                       
                        await LoginUser();
                        Navigator.pushNamed(context, ChatPage.id,arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                        Showsnackbar(context, 'No user found for that email.');
                        
                        } else if (e.code == 'wrong-password') {
                         
                        Showsnackbar(context, 'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      isloading=false;
                      setState(() {
                        
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don't have an account ? ",
                      style: TextStyle(color: Color(0xffC7EDE6)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, registerPage.id);
                      },
                      child: const Text(
                        "register",
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    ),
                  ],
                ),
                // const Spacer(flex: 3,)
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
     // ignore: unused_local_variable
     final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
