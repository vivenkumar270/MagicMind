import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magicmind/loginpage.dart';
import 'package:magicmind/screens/homescreen.dart';

class navi extends StatelessWidget {
  const navi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went Wrong"),
                );
              } else if (snapshot.hasData) {
                return const homescreen();
              }
              return const login_Screen();
            }),
      );
}
