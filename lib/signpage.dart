import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  //
  final TextEditingController fullnamecontroller = new TextEditingController();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        //height: size.height,
        padding: const EdgeInsets.fromLTRB(0, 200, 0, 250),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome, \nLet's Start With Signing Up",
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Image(
                        width: 30,
                        image: AssetImage('assets/a.png'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    //Fullnamecontroller
                    child: TextFormField(
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
                            fullnamecontroller.text = value!;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                      // onSaved: (value) {
                      //   setState(() {
                      //     emailcontroller.text = value!;
                      //   });
                      // },
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
                      // onSaved: (value) {
                      //   setState(() {
                      //     passwordcontroller.text = value!;
                      //   });
                      // },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // signIn(emailcontroller.text.trim(),
                      //     passwordcontroller.text.trim());
                    },

                    child: const Text(
                      "Signup",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    // child: islogin
                    //     ? const Text(
                    //         "Login",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 20),
                    //       )
                    //     : const Text(
                    //         'Signup',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 20),
                    //       ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.black,
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
                          borderRadius: BorderRadius.circular(30)))),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Already Registered? Login'))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
