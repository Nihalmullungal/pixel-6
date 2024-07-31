import 'package:customer_app/application/homescreen_bloc/homescreen_bloc.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_event.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_state.dart';
import 'package:customer_app/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeContr = BlocProvider.of<HomeScreenBloc>(context);
    homeContr.add(SplashScreenStartedevent());
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        if (state is SplashScreenFInishedState) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ), (route) => false);
        }
      },
      child: const Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CupertinoActivityIndicator()])),
      ),
    );
  }
}
