import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  State<SliverAppBarPage> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.pink[200],
          leading: Icon(Icons.menu),
          title: Text("Test SliverAppBar"),
          toolbarHeight: 300,
          floating: true,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Test SliverAppBar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            background: Container(
              color: const Color.fromARGB(255, 203, 61, 228),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 200,
              color: Colors.purple[200],
            ),
          ),
        )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 200,
              color: Colors.purple[200],
            ),
          ),
        )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 200,
              color: Colors.purple[200],
            ),
          ),
        )),
      ],
    );
  }
}
