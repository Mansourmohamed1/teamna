import 'package:flutter/material.dart';

class ProfileActivityItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const ProfileActivityItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });
}

class UserProfileModel {
  final String initials;
  final String fullName;
  final String roleAndCity;
  final String batchTag;
  final String trackTag;
  final String bio;
  final bool isVerified;
  final String verificationTitle;
  final String verificationDate;
  final int projectsCount;
  final int applicationsCount;
  final int avgMatchPercentage;
  final List<String> skills;
  final String primarySkill;
  final List<ProfileActivityItem> recentActivities;

  const UserProfileModel({
    required this.initials,
    required this.fullName,
    required this.roleAndCity,
    required this.batchTag,
    required this.trackTag,
    required this.bio,
    required this.isVerified,
    required this.verificationTitle,
    required this.verificationDate,
    required this.projectsCount,
    required this.applicationsCount,
    required this.avgMatchPercentage,
    required this.skills,
    required this.primarySkill,
    required this.recentActivities,
  });
}