import 'package:flutter/material.dart';

class RichTextPage extends StatefulWidget {
  const RichTextPage({super.key});

  @override
  State<RichTextPage> createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 350,
          color: Colors.grey[500],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 40, left: 5),
          child: RichText(
            // ignore: prefer_const_constructors
            text: TextSpan(style: TextStyle(fontSize: 20), children: [
              const TextSpan(
                  text: 'Text Title Test ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic)),
              const TextSpan(
                  text:
                      ' this is the text span in the rich text widget in flutter1 this is the text span in the rich text widget in flutter2 ',
                  style: TextStyle(color: Colors.black)),
            ]),
          ),
        )
      ],
    );
  }
}
