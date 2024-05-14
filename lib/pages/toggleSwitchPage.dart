import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class ToggerPage extends StatefulWidget {
  const ToggerPage({super.key});

  @override
  State<ToggerPage> createState() => _ToggerPageState();
}

class _ToggerPageState extends State<ToggerPage> {
  bool current1 = false;
  bool current2 = false;
  List<int> current3 = [1, 2, 3];
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedToggleSwitch<bool>.size(
          current: current1,
          values: [true, false],
          iconOpacity: 0.2,
          indicatorSize: Size.fromWidth(100),
          customIconBuilder: (context, local, global) =>
              Text(local.value ? 'yes' : 'no'),
          onChanged: (value) {
            setState(() {
              current1 = value;
              print(current1);
            });
          },
        ),
        AnimatedToggleSwitch<bool>.size(
          current: current2,
          values: [true, false],
          iconOpacity: 0.2,
          indicatorSize: Size.fromWidth(100),
          style: ToggleStyle(
            indicatorColor: current2 ? Colors.green : Colors.red,
            borderColor: current2 ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(
                  5,
                  5,
                ),
              ),
            ],
          ),
          customIconBuilder: (context, local, global) =>
              Icon(current2 ? Icons.done : Icons.close),
          onChanged: (value) {
            setState(() {
              current2 = value;
              print(current2);
            });
          },
        ),
        AnimatedToggleSwitch<int>.size(
          // textDirection: TextDirection.rtl,
          current: value,
          values: const [0, 1, 2, 3],
          iconOpacity: 0.2,
          indicatorSize: const Size.fromWidth(100),
          borderWidth: 4.0,
          iconAnimationType: AnimationType.onHover,
          style: ToggleStyle(
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
          foregroundIndicatorIconBuilder: (context, global) => Text(
            global.current.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          onChanged: (i) => setState(() => value = i),
        ),
      ],
    );
  }
}
