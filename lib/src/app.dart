import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_login/src/resources/user_repository.dart';
import 'package:firebase_login/src/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_login/src/widgets/splash_screen.dart';
import 'package:firebase_login/src/screens/home_screen.dart';
import 'package:firebase_login/src/screens/login_screen.dart';

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          return Container();
        },
      ),
    );
  }
}
