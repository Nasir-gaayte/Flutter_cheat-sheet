import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgets/pages/topBarPage.dart';

class IntroductioPage extends StatefulWidget {
  const IntroductioPage({super.key});

  @override
  State<IntroductioPage> createState() => _IntroductioPageState();
}

class _IntroductioPageState extends State<IntroductioPage> {
  PageController _controller = PageController();
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
            ),
            Container(
              decoration: BoxDecoration(color: Colors.red),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.yellow),
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
