import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToActPage extends StatefulWidget {
  const SlideToActPage({super.key});

  @override
  State<SlideToActPage> createState() => _SlideToActPageState();
}

class _SlideToActPageState extends State<SlideToActPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SlideAction(
            innerColor: Colors.purple.shade300,
            outerColor: Colors.purple.shade100,
            borderRadius: 15,
            sliderButtonIcon: Icon(Icons.forward_rounded),
            submittedIcon: Icon(Icons.done),
            text: 'done',
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white),
            onSubmit: () {
              return null;
            },
          ),
        ),
      ],
    );
  }
}
