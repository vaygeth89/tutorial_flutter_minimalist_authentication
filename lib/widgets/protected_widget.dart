import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_flutter_minimalist_authentication/cubit/user_authentication_cubit.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/session/authentication_data.dart';

class ProtectedWidget extends StatelessWidget {
  final Widget Function(BuildContext, AuthenticationData) onAuthenticated;

  final Widget onUnauthenticatedChild;
  const ProtectedWidget(
      {Key? key,
      required this.onAuthenticated,
      required this.onUnauthenticatedChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAuthenticationCubit, UserAuthenticationState>(
        builder: (context, authState) {
      if (authState is UserAuthenticated) {
        return onAuthenticated(context, authState.authenticationData);
      }
      //note you can add extra handling for different user states
      //for simplicity this widget will focus on protecting the child widget
      return onUnauthenticatedChild;
    }, listener: (context, authState) {
      //note if want to fire events upon changing states do it here
      //like showing snackbar when sign in succeeded or failed...etc
    });
  }
}
