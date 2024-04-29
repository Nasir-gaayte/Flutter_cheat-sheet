import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(color: Colors.amberAccent),
            child: Center(
              child: Text("H O M E"),
            ),
          ),
        ))
      ],
    );
  }
}
