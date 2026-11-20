class ShareProjectModel {
  final String id;
  final String title;
  final String categoryAndVisibility;
  final String description;
  final String techStack;
  final String membersAndMode;

  const ShareProjectModel({
    required this.id,
    required this.title,
    required this.categoryAndVisibility,
    required this.description,
    required this.techStack,
    required this.membersAndMode,
  });
}

class SharePersonModel {
  final String id;
  final String name;
  final String imageAssetPath;
  final String roleAndOrg;
  final String profileStatus;
  final bool isVerified;
  final List<String> skills;

  const SharePersonModel({
    required this.id,
    required this.name,
    required this.imageAssetPath,
    required this.roleAndOrg,
    required this.profileStatus,
    this.isVerified = false,
    required this.skills,
  });
}
