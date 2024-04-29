import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets/pages/NotePage.dart';
import 'package:widgets/pages/bottomNavBar.dart';
import 'package:widgets/pages/homePage.dart';
import 'package:widgets/pages/introductionPage.dart';
import 'package:widgets/pages/richTextPage.dart';
import 'package:widgets/pages/slideToActPage.dart';
import 'package:widgets/pages/sliverAppBarPage.dart';
import 'package:widgets/pages/timerPage.dart';

class TopBarPage extends StatefulWidget {
  const TopBarPage({super.key});

  @override
  State<TopBarPage> createState() => _TopBarPageState();
}

class _TopBarPageState extends State<TopBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'TabBar',
          )),
        ),
        body: const Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.text_decrease),
                ),
                Tab(
                  icon: Icon(Icons.tab_unselected),
                ),
                Tab(
                  icon: Icon(Icons.timer),
                ),
                Tab(
                  icon: Icon(Icons.border_bottom),
                ),
                Tab(
                  icon: Icon(Icons.arrow_forward),
                ),
                Tab(
                  icon: Icon(Icons.note),
                ),
                Tab(
                  icon: Icon(Icons.slideshow_sharp),
                ),
                Tab(
                  icon: Icon(Icons.do_disturb),
                ),
                Tab(
                  icon: Icon(Icons.do_disturb),
                ),
                Tab(
                  icon: Icon(Icons.do_disturb),
                ),
                Tab(
                  icon: Icon(Icons.do_disturb),
                ),
                Tab(
                  icon: Icon(Icons.do_disturb),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomePage(),
                  RichTextPage(),
                  SliverAppBarPage(),
                  TimerPage(),
                  BottomNavBarPage(),
                  IntroductioPage(),
                  NotePage(),
                  SlideToActPage(),
                  Column(),
                  Column(),
                  Column(),
                  Column(),
                  Column(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}