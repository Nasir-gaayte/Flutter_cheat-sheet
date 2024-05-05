import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final Color switchColor;
  final String location;
  const HomeCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.switchColor,
    required this.location,
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 0.46,
      width: width * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Card(
        color: switchValue ? Colors.white : Colors.white.withOpacity(0.5),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: switchValue ? widget.title + '\n' : 'Fur ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: switchValue ? widget.location : '????',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Switch(
                    value: switchValue,
                    activeColor: widget.switchColor,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: switchValue
                        ? Image.asset(
                            widget.imagePath,
                            height: width * 0.25,
                            width: width * 0.25,
                          )
                        : Container(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
