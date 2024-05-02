import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgets/pages/topBarPage.dart';

class IntroductioPage extends StatefulWidget {
  const IntroductioPage({super.key});

  @override
  State<IntroductioPage> createState() => _IntroductioPageState();
}

class _IntroductioPageState extends State<IntroductioPage>
    with SingleTickerProviderStateMixin {
  PageController _controller = PageController();
  late final AnimationController _animationController1;
  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController1.dispose();
  }

  bool isController = false;
  int onPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              onPage = value;
            });
          },
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Lottie.network(
                  'https://lottie.host/7b2ded61-20bb-403e-87c9-7917fc778633/p5H9WcQdo8.json'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: GestureDetector(
                onTap: () {
                  switch (isController) {
                    case (false):
                      setState(() {
                        isController = true;
                      });
                      _animationController1.forward();
                    case (true):
                      setState(() {
                        isController = false;
                      });
                      _animationController1.reverse();
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.ads_click,
                      size: 50,
                    ),
                    Lottie.network(
                      height: 150,
                      'https://lottie.host/3846e91c-1ce9-4785-a60f-b73055052c12/xJFP0IcWz8.json',
                      controller: _animationController1,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Lottie.network(
                  'https://lottie.host/6543ed4c-016c-4ab6-950a-12f9931169da/F78giuydyt.json'),
            ),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(child: Text('Skip')),
                onTap: () {
                  _controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut);
                },
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
              ),
              GestureDetector(
                child: Container(
                    child: onPage == 2
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TopBarPage(),
                                  ));
                            },
                            child: Text('DONE'))
                        : Text('Next')),
                onTap: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
