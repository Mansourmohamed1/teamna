import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:teamna/features/main/main_screen.dart';
=======
import 'package:t2mna/core/routes/app_routes.dart';
import 'package:t2mna/core/routes/routes_name.dart';
>>>>>>> origin/dev

class TeamnaApp extends StatelessWidget {
  const TeamnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
<<<<<<< HEAD
      designSize: const Size(375, 812),
=======
        designSize: const Size(375, 812),
>>>>>>> origin/dev
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
<<<<<<< HEAD
          // initialRoute: RouteNames.splash,
          // onGenerateRoute: AppRoutes.onGenerateRoute,
          home: MainScreen(),
        );
      },
    );
=======
          initialRoute: RouteNames.splash,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      }
    )
    ;
>>>>>>> origin/dev
  }
}
