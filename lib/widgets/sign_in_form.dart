import 'package:flutter/material.dart';

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
          MaterialButton(
              child: Text("Sign In"),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                widget.onSignIn(
                    emailTextController.text, passwordTextController.text);
              })
        ],
      ),
    );
  }
}
