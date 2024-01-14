import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cubit/app_cubit/app_cubit.dart';
import 'core/network/local/preference.dart';
import 'core/shared/shared/bloc_observer_manager.dart';
import 'features/home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getDataFromDb(),
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}