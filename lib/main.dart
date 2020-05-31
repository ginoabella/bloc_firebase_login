import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_login/src/resources/user_repository.dart';
import 'package:firebase_login/src/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_login/src/resources/simple_bloc_delegate.dart';
import 'package:firebase_login/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}
