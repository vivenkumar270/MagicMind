import 'package:flutter/material.dart';
import 'package:magicmind/screens/homescreen.dart';

class tellaboutyou extends StatefulWidget {
  const tellaboutyou({Key? key}) : super(key: key);

  @override
  State<tellaboutyou> createState() => _State();
}

class _State extends State<tellaboutyou> {
  final emailfield = TextFormField(
    autofocus: false,
    //controller: emailcontroller,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (!(value.toString().contains('@'))) {
        return 'Invalid Email';
      } else {
        return null;
      }
    },
    onSaved: (value) {
      //fullnamecontroller.text = value!;
      // setState(() {
      //   email = value!;
      // });
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
        fillColor: Colors.blueGrey,
        prefixIcon: const Icon(Icons.email_outlined),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email/Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
  );
  //const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0));

  // password field
  final passwordfield = TextFormField(
    autofocus: false,
    //controller: passwordcontroller,
    obscureText: true,
    validator: (value) {
      if ((value.toString().length < 6)) {
        return 'So Small';
      } else {
        return null;
      }
    },
    onSaved: (value) {
      //fullnamecontroller.text = value!;
      // setState(() {
      //   password = value!;
      // });
    },
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key_outlined),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 400),
            child: Center(
                child: GestureDetector(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Stack(children: const [
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.tag_faces_outlined,
                        size: 100,
                        color: Colors.white,
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white70,
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CameraApp()),
                // );
              },
            )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 550),
            child: Center(
                child: Text(
              "Welcome to MagicMind!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(20, 350, 20, 0),
          //   child: Container(
          //     child: TextField(
          //       onTap: () {},
          //       decoration: InputDecoration(
          //         contentPadding: const EdgeInsets.symmetric(
          //             vertical: 22.5, horizontal: 32.5),
          //         fillColor: Colors.blueGrey,
          //         filled: true,
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(25),
          //           borderSide:
          //               const BorderSide(color: Colors.blueGrey, width: 2.0),
          //         ),
          //         hintText: 'Full Name',
          //       ),
          //     ),
          //   ),
          // ),
          emailfield,
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 450, 20, 0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 22.5, horizontal: 32.5),
                    fillColor: Colors.blueGrey,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 2.0),
                    ),
                    hintText: 'Mobile Number',
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 550, 20, 0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 22.5, horizontal: 32.5),
                    fillColor: Colors.blueGrey,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 0),
                    ),
                    hintText: 'Date Of Birth (DD/MM/YYYY)',
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 600, 20, 0),
              child: Center(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 65,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homescreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0))),
                    icon: const Icon(Icons.double_arrow_rounded),
                    label: const Text(
                      "Continue",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
