import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:provider/provider.dart';
import 'package:widgets/pages/NotePage.dart';
import 'package:widgets/pages/bottomNavBar.dart';
import 'package:widgets/pages/homePage.dart';
import 'package:widgets/pages/introductionPage.dart';
import 'package:widgets/pages/richTextPage.dart';
import 'package:widgets/pages/slideToActPage.dart';
import 'package:widgets/pages/sliverAppBarPage.dart';
import 'package:widgets/pages/themeModePage.dart';
import 'package:widgets/pages/timerPage.dart';
import 'package:widgets/pages/toggleSwitchPage.dart';
import 'package:widgets/pages/videoPlayerPage.dart';
import 'package:widgets/theme/appThemeMode.dart';

class TopBarPage extends StatefulWidget {
  const TopBarPage({super.key});

  @override
  State<TopBarPage> createState() => _TopBarPageState();
}

class _TopBarPageState extends State<TopBarPage> {
  final _advancedDrawer = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawer,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 0.2,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {
                  Provider.of<AppThemeMode>(context, listen: false)
                      .getThemeMode();
                  ThemeData themeMode =
                      Provider.of<AppThemeMode>(context, listen: false)
                          .themeMode;
                  print(themeMode);
                },
                icon: Icon(Icons.dark_mode),
                label: Text('Theme Mode'))
          ],
        ),
      ),
      child: DefaultTabController(
        length: 17,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'TabBar',
              ),
            ),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawer,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
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
                    icon: Icon(Icons.color_lens),
                  ),
                  Tab(
                    icon: Icon(Icons.music_note),
                  ),
                  Tab(
                    icon: Icon(Icons.toggle_on),
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
                    ThemeModePage(),
                    VideoPlayerPage(),
                    ToggerPage(),
                    Column(),
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
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawer.showDrawer();
  }
}
