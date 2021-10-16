import 'package:flutter/material.dart';
import 'package:tutorial_flutter_minimalist_authentication/cubit/user_authentication_cubit.dart';
import 'package:tutorial_flutter_minimalist_authentication/pages/sign_in_page.dart';
import 'package:tutorial_flutter_minimalist_authentication/widgets/protected_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAuthCubit = context.watch<UserAuthenticationCubit>();
    return ProtectedWidget(
        onAuthenticated: (context, authData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Profile Page"),
              actions: [
                IconButton(
                    onPressed: () {
                      userAuthCubit.logoutUser();
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("User Id:" + authData.id),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Auth Token:" + authData.accessToken),
                ],
              ),
            ),
          );
        },
        onUnauthenticatedChild: const SignInPage());
  }
}
