import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import '../Home/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 90),
            child: Positioned(
              width: size.width,
              child: Image.asset("lib/Widgets/Welcome/img.png"),
            ),
          ),
          Positioned(
              top: size.height / 1.5,
              left: size.width / 20,
              child: Container(
                width: size.width / 1.3,
                child: const Text(
                  "It's Cooking Time!",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )),
          Positioned(
              top: size.height / 1.130,
              left: size.width / 20,
              width: size.width / 2,
              height: size.height / 14,
              child: Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(const Color(0xffb37e02)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffc98e00)),
                    shape:
                        MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home()
                        ));
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
