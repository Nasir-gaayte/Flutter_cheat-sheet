import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets/theme/appThemeMode.dart';

class ThemeModePage extends StatefulWidget {
  const ThemeModePage({super.key});

  @override
  State<ThemeModePage> createState() => _ThemeModePageState();
}

class _ThemeModePageState extends State<ThemeModePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
              child: TextButton(
                  onPressed: () =>
                      Provider.of<AppThemeMode>(context, listen: false)
                          .getThemeMode(),
                  child: Text('Change Theme'))),
        ),
      ],
    );
  }
}
