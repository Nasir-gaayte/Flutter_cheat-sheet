import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    Center(
      child: Container(
        alignment: Alignment.center,
        child: Text('home'),
      ),
    ),
    Center(
      child: Container(
        alignment: Alignment.center,
        child: Text('richText'),
      ),
    ),
    Center(
      child: Container(
        alignment: Alignment.center,
        child: Text('SliverAppBar'),
      ),
    ),
    Center(
      child: Container(
        alignment: Alignment.center,
        child: Text('Timer'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_decrease),
              label: 'Rich Text',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tab_unselected),
              label: 'Sliver App Bar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',
            ),
          ],
        ));
  }
}
