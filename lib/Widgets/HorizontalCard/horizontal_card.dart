import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalCard extends StatefulWidget {
  var title;
  var img;
  var reating;
  HorizontalCard(
      {Key? key, required this.title, required this.img, required this.reating})
      : super(key: key);

  @override
  _HorizontalCardState createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 300,
          width: size.width / 2.5,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(widget.img.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: size.width / 2.5,
              height: 300,
              decoration: const  BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width / 2.8,
                height: 300,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.fade,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 260,
          left: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[800],
              ),
              Text(
                widget.reating.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
