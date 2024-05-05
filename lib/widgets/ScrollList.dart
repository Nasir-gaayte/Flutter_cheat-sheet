import 'package:flutter/material.dart';

class ScrollList extends StatefulWidget {
  final List<String> menuItems;
  final int seletIndex;
  final Function(int) onItemTap;
  const ScrollList({
    super.key,
    required this.menuItems,
    required this.seletIndex,
    required this.onItemTap,
  });

  @override
  State<ScrollList> createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (int i = 0; i < widget.menuItems.length; i++)
          buildMenuItem(widget.menuItems[i], widget.seletIndex == i, i)
      ]),
    );
  }

  buildMenuItem(String text, bool isSelected, int index) {
    return InkWell(
      onTap: () {
        widget.onItemTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
