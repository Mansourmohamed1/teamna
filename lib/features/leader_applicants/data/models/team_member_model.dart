import 'package:flutter/material.dart';

class TeamMemberModel {
  final String id;
  final String initials;
  final Color avatarColor;
  final Color avatarBgColor;
  final String name;
  final String role;
  final int completedTasks;

  const TeamMemberModel({
    required this.id,
    required this.initials,
    required this.avatarColor,
    required this.avatarBgColor,
    required this.name,
    required this.role,
    required this.completedTasks,
  });

  String get firstName => name.split(' ').first;
}