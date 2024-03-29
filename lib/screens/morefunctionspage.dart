import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class morefunctionspage extends StatefulWidget {
  const morefunctionspage({Key? key}) : super(key: key);

  @override
  State<morefunctionspage> createState() => _State();
}

class _State extends State<morefunctionspage> {
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
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 230),
            child: Center(
                child: Icon(
              Icons.sentiment_satisfied_rounded,
              color: Colors.white,
              size: 100,
            )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 300, 0, 100),
            child: Center(
                child: Text(
              " Please Be Patient We are\n Working this Feature\n It will be availaible soon",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
