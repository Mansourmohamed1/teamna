import 'package:flutter/material.dart';
import 'package:t2mna/core/routes/routes_name.dart';

abstract final class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //  AUTH 

      // case RouteNames.splash:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //     settings: settings,
      //   );

    

      



      //  NOT FOUND 

      default:
        return _placeholderRoute(
          settings,
          'Not Found',
        );
    }
  }

  static MaterialPageRoute<void> _placeholderRoute(
    RouteSettings settings,
    String title,
  ) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => Scaffold(
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}