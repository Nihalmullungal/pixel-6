import 'package:customer_app/application/addscreen_bloc/addscreen_bloc.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_bloc.dart';
import 'package:customer_app/presentation/constants/app_theme.dart';
import 'package:customer_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenBloc(),
        ),
        BlocProvider(
          create: (context) => AddScreenBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Customer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ThemeOfApp.theme),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
