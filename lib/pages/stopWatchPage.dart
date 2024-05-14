import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Duration _duration = Duration();
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: buildTimer());
  }

  buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_duration.inHours.toString()),
        Text(_duration.inMinutes.toString()),
        Text(_duration.inSeconds.toString()),
        Text(_duration.inMicroseconds.toString()),
      ],
    );
  }

  void startTimer() {
    var addSecond = 1;
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        addTimer();
      },
    );
  }

  void addTimer() {
    _duration = Duration(seconds: 1 + _duration.inSeconds);
    setState(() {});
  }
}
