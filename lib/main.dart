import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets/dommyData/noteData.dart';
import 'package:widgets/pages/homePage.dart';
import 'package:widgets/pages/richTextPage.dart';
import 'package:widgets/pages/sliverAppBarPage.dart';
import 'package:widgets/pages/timerPage.dart';
import 'package:widgets/pages/topBarPage.dart';
import 'package:widgets/theme/appThemeMode.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        Provider<AppThemeMode>(
          create: (context) => AppThemeMode(),
        ),
        Provider<NoteData>(
          create: (context) => NoteData(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<AppThemeMode>(context).themeMode,
      home: TopBarPage(),
    );
  }
}
