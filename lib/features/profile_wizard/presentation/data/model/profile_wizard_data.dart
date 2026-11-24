import 'package:flutter/material.dart';

abstract final class ProfileOptions {
  static const tracks = ['Flutter', 'Front-End', 'Back-End', 'UI/UX Design', 'QA', 'Data', 'DevOps'];
  static const rounds = ['Round 5', 'Round 6', 'Round 7', 'Round 8'];
  static const statuses = ['In training', 'Graduated', 'Alumni'];
  static const skills = ['Flutter', 'Dart', 'Firebase', 'BLoC', 'REST APIs', 'Git', 'Figma', 'Node.js', 'SQL', 'Testing'];
  static const levels = ['Beginner', 'Intermediate', 'Advanced'];
}

class ProfileWizardData {
  int initiativeIndex = 0;
  String track = 'Flutter';
  String round = 'Round 7';
  String status = 'In training';
  final Set<String> skills = {};
  String level = 'Intermediate';
  String? fileName;
  final githubController = TextEditingController();

  void dispose() => githubController.dispose();
}