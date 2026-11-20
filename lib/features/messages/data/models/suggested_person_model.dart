class SuggestedPersonModel {
  final String id;
  final String name;
  final String imageUrl;
  final String roleAndOrg;
  final String statusText;
  final bool isVerified;
  final bool isOnline;
  final String? actionButtonText;

  const SuggestedPersonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.roleAndOrg,
    required this.statusText,
    this.isVerified = false,
    this.isOnline = false,
    this.actionButtonText,
  });
}

class TeammateSuggestionModel {
  final String id;
  final String name;
  final String projectTitle; // e.g. "Your teammate · Student Planner"

  const TeammateSuggestionModel({
    required this.id,
    required this.name,
    required this.projectTitle,
  });
}
