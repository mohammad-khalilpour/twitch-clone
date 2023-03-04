import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitch_clone/firebase_options.dart';
import 'package:twitch_clone/src/bloc/auth/auth_bloc.dart';
import 'package:twitch_clone/src/screens/landing_page_screen.dart';
import 'package:twitch_clone/src/screens/main_screen.dart';
import 'package:twitch_clone/src/screens/otp_screen.dart';
import 'package:twitch_clone/src/utils/loading_screen.dart';
import 'package:twitch_clone/src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc()
        ..add(
          const AppEventInitialize(),
        ),
      child: MaterialApp(
        title: 'Twitch',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black87,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, appState) {
            if (appState.authError != null) {
              showSnackBar(
                context,
                appState.authError.toString(),
              );
            }
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            }
          },
          builder: (context, appState) {
            if (appState is AppStateLoggedOut) {
              return const LandingPageScreen();
            } else if (appState is AppStateIsInOtpScreen) {
              return const OtpScreen();
            } else if (appState is AppStateLoggedIn) {
              print(appState.user.toString());
              return const MainScreen();
            } else {
              // this should never happen
              return Container();
            }
          },
        ),
      ),
    );
  }
}
