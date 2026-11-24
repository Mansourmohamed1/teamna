import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:t2mna/core/routes/routes_name.dart';
import 'package:t2mna/features/auth/presentation/ui/login_screen.dart';
import 'package:t2mna/features/auth/presentation/ui/register_screen.dart';
import 'package:t2mna/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/profile_success.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/profile_wizard_screen.dart';
import 'package:t2mna/features/splash/splash_screen.dart';
>>>>>>> origin/dev

abstract final class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
<<<<<<< HEAD
      //  AUTH

      // case RouteNames.splash:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //     settings: settings,
      //   );

      //  NOT FOUND

      default:
        return _placeholderRoute(settings, 'Not Found');
=======
      //  AUTH 

      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );
        case RouteNames.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings: settings,
        );
        case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
        case RouteNames.profileWizard:
        return MaterialPageRoute(
          builder: (_) => const ProfileWizardScreen(),
          settings: settings,
        );
        case RouteNames.profileSuccess:
        return MaterialPageRoute(
          builder: (_) => const ProfileSuccessScreen(),
          settings: settings,
        );
        



    

      



      //  NOT FOUND 

      default:
        return _placeholderRoute(
          settings,
          'Not Found',
        );
>>>>>>> origin/dev
    }
  }

  static MaterialPageRoute<void> _placeholderRoute(
    RouteSettings settings,
    String title,
  ) {
    return MaterialPageRoute<void>(
      settings: settings,
<<<<<<< HEAD
      builder: (_) => Scaffold(body: Center(child: Text(title))),
    );
  }
}
=======
      builder: (_) => Scaffold(
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
>>>>>>> origin/dev
