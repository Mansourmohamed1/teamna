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
    logoPath: 'assets/image/depiEN.png',
  ),
  Initiative(
    name: 'NTI',
    subtitle: 'National Telecommunications Institute',
    logoPath: 'assets/image/nti.png',
  ),
  Initiative(
    name: 'ITI',
    subtitle: 'Information Technology Institute',
    logoPath: 'assets/image/iti.png',
  ),
  Initiative(
    name: 'University program',
    subtitle: 'Faculty of Engineering or CS',
    logoPath: 'assets/image/uni.png',
  ),
  Initiative(
    name: 'Other / Self-taught',
    subtitle: 'Bootcamps, courses and side projects',
    logoPath: 'assets/image/self.png',
  ),
];