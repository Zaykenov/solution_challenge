import 'package:flutter/material.dart';
import 'package:solution_challenge/my_flutter_app_icons.dart';

import '../widgets/bottomBarWidget.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Map",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/mini_map.png'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // Button's onPressed logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E3F51),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                      child: const Row(
                        children: [
                          Text('Search pharmacy'),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios, size: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Call",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  'Show all',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Blog",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Image.network(
                'https://drive.google.com/uc?export=view&id=13L5vUbchBJ21--KSe5IlknLJE2Nxw5MQ',
                fit: BoxFit.fill,
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: RoundedBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
