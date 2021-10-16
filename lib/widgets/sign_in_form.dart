import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_flutter_minimalist_authentication/cubit/user_authentication_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key, required this.onSignIn}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();

  final Function(String, String) onSignIn;
}

class _SignInFormState extends State<SignInForm> {
  final emailTextController = TextEditingController(text: "");
  final passwordTextController = TextEditingController(text: "");
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthenticationCubit, UserAuthenticationState>(
        builder: (context, authState) {
      return Container(
        constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailTextController,
              focusNode: emailFocusNode,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordTextController,
              focusNode: passwordFocusNode,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 15,
            ),
            Builder(builder: (context) {
              String errorMessage = "";
              if (authState is UserAuthenticationEmailNotConfirmed) {
                errorMessage =
                    "Please confirm your email by checking your inbox";
              } else if (authState is UserAuthenticationInvalidCredentials) {
                errorMessage = "Invalid credentials!";
              } else if (authState is UserAuthenticationError) {
                errorMessage = "Something went wrong, try again";
              }
              return Text(
                errorMessage,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.apply(color: Colors.redAccent),
              );
            }),
            SizedBox(
              height: 10,
            ),
            //You may want to lock the sign in when user is being authenticated
            MaterialButton(
                child: Text("Sign In"),
                color: Theme.of(context).primaryColor,
                onPressed: authState is UserAuthenticating
                    ? null
                    : () {
                        widget.onSignIn(emailTextController.text,
                            passwordTextController.text);
                      })
          ],
        ),
      );
    });
  }
}
