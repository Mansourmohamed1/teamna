class Initiative {
  final String name;
  final String subtitle;
  final String logoPath;

  const Initiative({
    required this.name,
    required this.subtitle,
    required this.logoPath,
  });
}

const initiatives = [
  Initiative(
    name: 'DEPI',
    subtitle: 'Digital Egypt Pioneers Initiative',
    logoPath: 'assets/images/depiEN.png',
  ),
  Initiative(
    name: 'NTI',
    subtitle: 'National Telecommunications Institute',
    logoPath: 'assets/images/nti.png',
  ),
  Initiative(
    name: 'ITI',
    subtitle: 'Information Technology Institute',
    logoPath: 'assets/images/iti.png',
  ),
  Initiative(
    name: 'University program',
    subtitle: 'Faculty of Engineering or CS',
    logoPath: 'assets/images/uni.png',
  ),
  Initiative(
    name: 'Other / Self-taught',
    subtitle: 'Bootcamps, courses and side projects',
    logoPath: 'assets/images/self.png',
  ),
];