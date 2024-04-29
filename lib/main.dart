import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets/dommyData/noteData.dart';
import 'package:widgets/pages/homePage.dart';
import 'package:widgets/pages/richTextPage.dart';
import 'package:widgets/pages/sliverAppBarPage.dart';
import 'package:widgets/pages/timerPage.dart';
import 'package:widgets/pages/topBarPage.dart';
import 'package:widgets/theme/lightMode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightMode().lightMode,
        home: TopBarPage(),
      ),
    );
  }
}
