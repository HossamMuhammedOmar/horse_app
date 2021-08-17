import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/screens/splash_screen.dart';
import 'networking/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..getAllCategories()
            ..getAllPostsData()
            ..getAllTrainers()
            ..getIndivReservation()
            ..getUserDataById(),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        title: 'Horse App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
      ),
    );
  }
}
