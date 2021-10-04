import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'dart:async';

class Info extends StatefulWidget {
  String title;
  String id;
  String img;
  var time;
  var level;
  Info(
      {Key? key,
      required this.title,
      required this.id,
      required this.img,
      required this.level,
      required this.time})
      : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool _isAnimated = false;
  @override
  Widget build(BuildContext context) {
    void animate() {
      // animate
      // setState _isAnimated  to true to show animations
      setState(() {
        _isAnimated = true;
      });
    }

    Timer(const Duration(milliseconds: 245), () => animate());

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.img),
                fit: BoxFit.cover,
              )),
            ),
          ),
          SlidingSheet(
            addTopViewPaddingOnFullscreen: true,
            duration: const Duration(milliseconds: 560),
            backdropColor: Colors.black54,
            cornerRadius: 35,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.65, 1.0],
              positioning: SnapPositioning.relativeToSheetHeight,
            ),
            builder: (context, state) {
              return SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: _isAnimated == true ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 540),
                        margin: const EdgeInsets.only(
                          left: 20,
                        ),
                        width: size.width / 1.2,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 25,
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: _isAnimated == true ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: size.width / 3.5,
                            margin: EdgeInsets.only(top: size.height / 12),
                            height: size.height / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.alarm_rounded,
                                  size: 60,
                                  color: Colors.green,
                                ),
                                Text(
                                  widget.time.toString() + " MIN",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffdff5e5),
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _isAnimated == true ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 400),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            // width: size.width / 3.5,
                            width: _isAnimated == true ? size.width / 3.5 : 2.0,
                            margin: EdgeInsets.only(top: size.height / 12),
                            height: size.height / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.mood_rounded,
                                  size: 60,
                                  color: Color(0xffffb012),
                                ),
                                Text(
                                  "MEDIUM",
                                  style: TextStyle(
                                    color: Color(0xffffb012),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfffaf7d2),
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _isAnimated == true ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: size.width / 3.5,
                            margin: EdgeInsets.only(top: size.height / 12),
                            height: size.height / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.local_fire_department_rounded,
                                  size: 60,
                                  color: Color(0xff77b1f7),
                                ),
                                Text(
                                  widget.level.toString() + " SERVING",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: Color(0xff77b1f7),
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffdbf3ff),
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            headerBuilder: (context, state) {
              return Container(
                height: 56,
                width: double.infinity,
                alignment: Alignment.center,
                child: Container(
                  width: size.width / 8,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: const Icon(
                      Icons.keyboard_arrow_left_sharp,
                      size: 50,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.black26,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
