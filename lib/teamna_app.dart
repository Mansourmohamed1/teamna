import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/routes/app_routes.dart';
import 'package:t2mna/core/routes/routes_name.dart';
import 'package:t2mna/features/messages/presentation/pages/chat_details_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/conversation_info_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/messages_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/new_conversation_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/team_chat_screen.dart';

class TeamnaApp extends StatelessWidget {
  const TeamnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: RouteNames.splash,
          // onGenerateRoute: AppRoutes.onGenerateRoute,
          home: MessagesScreen(),
        );
      },
    );
  }
}
