import 'package:flutter/material.dart';

class SelectorAppBar extends StatefulWidget {
  const SelectorAppBar({Key? key}) : super(key: key);

  @override
  State<SelectorAppBar> createState() => _SelectorAppBarState();
}

class _SelectorAppBarState extends State<SelectorAppBar> {
  final DateTime currentDate = DateTime.now();
  final int daysInMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  final ScrollController _scrollController = ScrollController();
  int selectedDateIndex = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int currentIndex = currentDate.day - 1;
      final double initialScrollOffset = currentIndex * 50;
          // currentIndex * (MediaQuery.of(context).size.width / 7.9);
      _scrollController.jumpTo(initialScrollOffset);
      selectedDateIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Container(
        height: 40,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: daysInMonth,
          itemBuilder: (context, index) {
            int dayOfMonth = index + 1;
            int relativeDay = dayOfMonth - currentDate.day;

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedDateIndex == index) {
                    // Deselect the date
                    selectedDateIndex = -1;
                  } else {
                    // Select a different date
                    selectedDateIndex = index;
                  }
                });
              },
              child: Container(
                width: relativeDay == 0 ? 100 : 50,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: selectedDateIndex == index
                      ? Color(0xff040415) // Change color for selected date
                      : relativeDay == 0
                          ? Color(0xffF5F5F6)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    relativeDay == 0
                        ? "Today"
                        : '${currentDate.day + relativeDay}',
                    style: TextStyle(
                        fontSize: 20,
                        color: selectedDateIndex == index
                            ? Colors.white
                            : Color(0xff7D7D85)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      backgroundColor: Color(0xFFF6F6F6),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
