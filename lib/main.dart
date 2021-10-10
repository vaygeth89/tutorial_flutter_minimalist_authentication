import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_flutter_minimalist_authentication/cubit/user_authentication_cubit.dart';
import 'package:tutorial_flutter_minimalist_authentication/repositories/api/fake_account_api_service.dart';
import 'package:tutorial_flutter_minimalist_authentication/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserAuthenticationCubit>(
              lazy: false,
              create: (_) => UserAuthenticationCubit(
                    FakeAccountAPIService(),
                  )),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
