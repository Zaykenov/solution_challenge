import 'package:flutter/material.dart';

class SelectorAppBar extends StatefulWidget {
  const SelectorAppBar({super.key});

  @override
  State<SelectorAppBar> createState() => _SelectorAppBarState();
}

class _SelectorAppBarState extends State<SelectorAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Stack(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            // color: Colors.red,
          ),
          Container(
            // width: 100,
            height: 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 300,
              itemBuilder: ((context, index) {
                return Container(
                  height: 30,
                  width: 30,
                  color: index % 2 == 1 ? Colors.green : Colors.red,
                );
              }),
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      backgroundColor: Color(0xFFF6F6F6),
    );
  }
}
