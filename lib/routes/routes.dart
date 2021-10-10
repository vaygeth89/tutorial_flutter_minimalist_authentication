import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tutorial_flutter_minimalist_authentication/pages/landing_page.dart';
import 'package:tutorial_flutter_minimalist_authentication/pages/sign_in_page.dart';
import 'package:tutorial_flutter_minimalist_authentication/pages/user_profile_page.dart';

class Routes {
  static const String landingPageRoute = "/";
  static const String signInPageRoute = "/sign-in";
  static const String profilePageRoute = "/profile";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signInPageRoute:
        {
          return CupertinoPageRoute(
              settings: settings,
              title: signInPageRoute,
              builder: (_) => SignInPage());
        }
      case profilePageRoute:
        {
          return CupertinoPageRoute(
              settings: settings,
              title: profilePageRoute,
              builder: (_) => UserProfilePage());
        }

      case landingPageRoute:
      default:
        {
          return CupertinoPageRoute(
              settings: settings,
              title: landingPageRoute,
              builder: (_) => LandingPage());
        }
    }
  }
}
