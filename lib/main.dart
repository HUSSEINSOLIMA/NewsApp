// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types, dead_code, must_be_immutable

import 'package:News/DIO/chacedHelper.dart';
import 'package:News/DIO/dio_helper.dart';
import 'package:News/cubit/app_cubit_cubit.dart';
import 'package:News/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newsApp/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dioHelper.init();
  await ChachweHelper.init();
  //bool isDark = ChachweHelper.getBoolan(key: 'isDark')!;
  // bool isDark = bool2;

  runApp(myApp());
}

class myApp extends StatelessWidget {
  // final bool isDark;

  // myApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..modeStates(),
        ),
        BlocProvider(
            create: (BuildContext context) => newsCubits()
              ..getBusiness()
              ..getScience()
              ..getSports()),
      ],
      child: BlocConsumer<AppCubit, AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  color: Colors.white,
                ),
                dividerColor: Colors.grey,
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orangeAccent,
                  elevation: 0.0,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarIconBrightness: Brightness.light),
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  color: Colors.black,
                ),
                dividerColor: Colors.white12,
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.black,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.orangeAccent,
                  elevation: 0.0,
                  backgroundColor: Colors.black,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: newsSCcreen());
        },
      ),
    );
  }
}
