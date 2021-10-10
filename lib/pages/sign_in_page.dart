import 'package:flutter/material.dart';
import 'package:tutorial_flutter_minimalist_authentication/cubit/user_authentication_cubit.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/sign_in.dart';
import 'package:tutorial_flutter_minimalist_authentication/widgets/sign_in_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAuthCubit = context.watch<UserAuthenticationCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SignInForm(
            onSignIn: (emailInput, passwordInput) {
              userAuthCubit.signInUser(
                  SignIn(email: emailInput, password: passwordInput));
            },
          )),
    );
  }
}
