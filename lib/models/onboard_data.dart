class OnBoarding {
  final String title;
  final String text;
  final String image;

  OnBoarding({required this.title, required this.text, required this.image});
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Manage your pills',
    text: 'Record and keep track on drug consumption',
    image: 'assets/images/onboarding1.png',
  ),
  OnBoarding(
    title: 'Track your mood and physical\nactivity',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing,do eiusmod tempor ut labore',
    image: 'assets/images/onboarding2.png',
  ),
  OnBoarding(
    title: 'Check relevant articles',
    text: 'Read up-tp-date articles and papers from experts',
    image: 'assets/images/onboarding3.png',
  ),
  OnBoarding(
    title: 'Consult with doctors',
    text: 'Connect with your doctor easily through Google Meet',
    image: 'assets/images/onboarding4.png',
  ),
];
