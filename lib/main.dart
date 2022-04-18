import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magicmind/loginpage.dart';
import 'package:magicmind/provider/authentication.dart';
import 'package:magicmind/screens/homescreen.dart';
//import 'package:magicmind/screens/homescreen.dart';
import 'package:magicmind/themes/apptheme.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

//import 'provider/authentication.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const login_Screen(),
        // home: StreamBuilder<User?>(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return const homescreen();
        //       } else {
        //         return const login_Screen();
        //       }
        //     }),
        //theme: AppTheme.light,
        theme: AppTheme.dark,
        //themeMode: ThemeMode.system,
      ));
}
