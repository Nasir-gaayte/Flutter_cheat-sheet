import 'dart:async';

import 'package:flutter/cupertino.dart';
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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTimerContent(
                  Text(
                    _duration.inHours.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  'hour'),
              buildTimerContent(
                  Text(
                    _duration.inMinutes.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  'minute'),
              buildTimerContent(
                  Text(
                    _duration.inSeconds.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  'seconds'),
            ],
          ),
        ),
        buildTimer(),
        ElevatedButton.icon(
            onPressed: () {}, icon: Icon(Icons.pause), label: Text('Pause')),
        ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _timer?.cancel();
              });
            },
            icon: Icon(Icons.stop),
            label: Text('Stop')),
      ],
    ));
  }

  buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(_duration.inHours.toString()),
        // Text(_duration.inMinutes.toString()),
        Text(_duration.inSeconds.toString()),
        // Text(_duration.inMicroseconds.toString()),
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

  buildTimerContent(Text text, String text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 85,
          width: 85,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: text,
        ),
        Text(text2),
      ],
    );
  }
}
