import 'package:flutter/material.dart';
import 'package:tutorial_flutter_minimalist_authentication/routes/routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Landing page")),
      body: Center(
        child: MaterialButton(
            child: Text("Go to my profile"),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.profilePageRoute);
            }),
      ),
    );
  }
}
