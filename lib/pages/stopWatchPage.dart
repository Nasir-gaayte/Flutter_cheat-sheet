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
  Widget build(BuildContext context) {
    return Center(child: buildTimer());
  }

  buildTimer() {
    return Row(
      children: [],
    );
  }
}
