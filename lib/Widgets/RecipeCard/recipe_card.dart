import 'package:app/Widgets/Info/info.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  var title;
  var time;
  var level;
  var img;
  RecipeCard({Key? key, @required this.title, this.time, this.level, this.img})
      : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Info(
                            title: widget.title,
                            id: "1",
                            img: widget.img,
                            time: widget.time,
                            level: widget.level,
                          )));
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: size.height / 4,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Container(
                      width: size.width / 2.7,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: NetworkImage(widget.img.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 20),
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 2,
                            height: size.height / 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    widget.time < 30
                                        ? const Icon(
                                            Icons.access_time_filled,
                                            color: Colors.green,
                                          )
                                        : widget.time > 45
                                            ? const Icon(
                                                Icons.access_time_filled,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.access_time_filled,
                                                color: Colors.orange,
                                              ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.time.toString() + " Min",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    widget.level > 3
                                        ? const Icon(
                                            Icons.groups_rounded,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            Icons.groups_rounded,
                                            color: Colors.red,
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.level.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
