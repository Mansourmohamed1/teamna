import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/teamna_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const TeamnaApp());
}

