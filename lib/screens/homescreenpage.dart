import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homescreenpage extends StatefulWidget {
  const homescreenpage({Key? key}) : super(key: key);

  @override
  State<homescreenpage> createState() => _State();
}

class _State extends State<homescreenpage> {
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
            // child: Center(
            //     child: Icon(
            //   Icons.sentiment_satisfied_rounded,
            //   color: Colors.white,
            //   size: 100,
            // )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 400),
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Center(
                    child: Text(
                  " Welcome To Magic Mind\n Let's get started,\n"
                  " You can start by Checking Your\n Mood State.\n\n\n"
                  " We also have Chart Section,\n"
                  " Also you can check Calender\n Hub for your Dates.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
