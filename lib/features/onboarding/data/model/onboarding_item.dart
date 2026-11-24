class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;
  final double panelHeightFactor; 
   final double imageHeight;

  const OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.panelHeightFactor, required this.imageHeight,
  });
}

const onboardingItems = [
  OnboardingItem(
     imageHeight: 540,
    imagePath: 'assets/image/onboading1.png',
    title: 'Find\nYour People',
    description: 'Connect with like-minded developers, designers,\n and creators from DEPI , NTI , ITI and more.',
    buttonText: 'Next',
    panelHeightFactor: 0.40
  ),
  OnboardingItem(
    imageHeight: 495,
    imagePath: 'assets/image/onboading2.png',
    title: 'Build\nReal Teams',
    description: 'Bring different skills together, form the right\n team, and turn your ideas into real projects.',
    buttonText: 'Next',
    panelHeightFactor: 0.36
  ),
  OnboardingItem(
     imageHeight: 518,
    imagePath: 'assets/image/onbording 3.png',
    title: 'From Ideas to\nImpact',
    description: 'Manage tasks, track progress, and collaborate\n with your team to turn ideas into real products.',
    buttonText: 'Start',
    panelHeightFactor: 0.34
  ),
];