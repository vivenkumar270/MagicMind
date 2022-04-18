// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:magicmind/screens/homescreen.dart';
import 'package:magicmind/signpage.dart';
import 'package:provider/provider.dart';
import 'provider/authentication.dart';

class login_Screen extends StatefulWidget {
  const login_Screen({Key? key}) : super(key: key);

  @override
  State<login_Screen> createState() => _login_ScreenState();
}

class _login_ScreenState extends State<login_Screen> {
  final formkey = GlobalKey<FormState>();
  //passing strings
  bool islogin = false;

  String email = '';
  String password = '';
  String fullname = '';
  //editing controller
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          //height: size.height,
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 250),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, \nWelcome Back",
                  style: Theme.of(context).textTheme.headline1),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        width: 30,
                        image: AssetImage('assets/a.png'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  //fullname
                  Container(
                    padding: const EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    //Fullnamecontroller
                    child: !islogin
                        ? TextFormField(
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: fullnamecontroller,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: "FullName",
                            ),
                            validator: (value) {
                              if (value.toString().length < 3) {
                                return 'Name is too small';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              //fullnamecontroller.text = value!;
                              setState(() {
                                fullname = value!;
                              });
                            },
                          )
                        : Container(),
                  ),
                  !islogin
                      ? const SizedBox(
                          height: 15,
                        )
                      : Container(),

                  Container(
                    padding: const EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    //emailcontroller
                    child: TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (!(value.toString().contains('@'))) {
                          return 'Invalid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //
                  Container(
                    padding: const EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    //password controller
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if ((value.toString().length < 6)) {
                          return 'So Small';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          SignUp(email, password);
                        }
                      },

                      // child: const Text(
                      //   "Login",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 20),
                      // ),
                      child: islogin
                          ? const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          : const Text(
                              'Signup',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Signup With Google',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          islogin = !islogin;
                        });
                      },
                      child: islogin
                          ? const Text("Don't Have An Account? Signup")
                          : const Text("Already Signed Up? Login"))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
