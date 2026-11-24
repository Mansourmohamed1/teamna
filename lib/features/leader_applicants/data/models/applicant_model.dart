import 'package:flutter/material.dart';

class ApplicantModel {
  final String id;
  final String initials;
  final Color avatarColor;
  final Color avatarBgColor;
  final String name;
  final String roleTitle;
  final String roleCategory;
  final String batchTag;
  final int matchPercentage;
  final String pitch;
  final String githubUrl;
  final String availability;

  const ApplicantModel({
    required this.id,
    required this.initials,
    required this.avatarColor,
    required this.avatarBgColor,
    required this.name,
    required this.roleTitle,
    required this.roleCategory,
    required this.batchTag,
    required this.matchPercentage,
    required this.pitch,
    required this.githubUrl,
    required this.availability,
  });
}