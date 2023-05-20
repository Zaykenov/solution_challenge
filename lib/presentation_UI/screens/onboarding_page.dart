import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/main.dart';
import 'package:solution_challenge/model/onboard_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_challenge/presentation_UI/screens/login_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? mainColor : secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Image.asset(
                      onboardingContents[index].image,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      onboardingContents[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      onboardingContents[index].text,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                currentPage == onboardingContents.length - 1
                    ? ElevatedButton(
                        child: const Text('Get Started'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Adjust the value to control the roundness of the corners
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal:
                                    24), // Adjust the padding to increase the button size
                            backgroundColor: mainColor),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: List.generate(
                              onboardingContents.length,
                              (index) => dotIndicator(index),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
