import 'package:flutter/material.dart';

class TeamRoleModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  int count;

  TeamRoleModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.count = 0,
  });
}