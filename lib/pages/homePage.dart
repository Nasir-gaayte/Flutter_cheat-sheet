import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets/widgets/ScrollList.dart';
import 'package:widgets/widgets/homeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menuItems = [
    'koow ',
    'labo',
    'iyo',
    'sadex',
    'waxkale',
    'hada',
  ];
  int seletIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            const Color.fromARGB(255, 76, 175, 153),
            Color.fromARGB(255, 255, 218, 84),
            Colors.red.shade300,
          ],
          center: Alignment(0.0, 1),
          stops: [0.0, 0.5, 1.0],
          radius: 0.9,
        ),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: "SOO DHAWOO\n",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextSpan(
                      text: "wax walba aad u baahantahay oo dhan ka hel halka",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
              Container(
                height: 120,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset('assets/icons/search_3x2.jpg'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ScrollList(
            menuItems: menuItems,
            seletIndex: seletIndex,
            onItemTap: (p0) {
              setState(() {
                seletIndex = p0;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '4 Card oo sawir wata',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  HomeCard(
                    title: 'test',
                    imagePath: 'assets/icons/chating_3x2.jpg',
                    switchColor: Colors.black,
                    location: menuItems[seletIndex],
                  ),
                  HomeCard(
                    title: 'test',
                    imagePath: 'assets/icons/chating_3x2.jpg',
                    switchColor: Colors.green,
                    location: menuItems[seletIndex],
                  ),
                  HomeCard(
                    title: 'test',
                    imagePath: 'assets/image/i2.gif',
                    switchColor: Colors.blue,
                    location: menuItems[seletIndex],
                  ),
                  HomeCard(
                    title: 'test',
                    imagePath: 'assets/image/i3.gif',
                    switchColor: Colors.red,
                    location: menuItems[seletIndex],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
