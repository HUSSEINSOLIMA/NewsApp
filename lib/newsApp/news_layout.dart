// ignore_for_file: prefer_const_constructors, implementation_imports, unused_import, unnecessary_import, camel_case_types, use_key_in_widget_constructors

import 'package:News/DIO/chacedHelper.dart';
import 'package:News/cubit/states.dart';
import 'package:News/main.dart';
import 'package:News/search/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:News/DIO/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit_cubit.dart';
import '../cubit/cubit.dart';

class newsSCcreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubits, cubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = newsCubits.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).modeStates();
                  },
                  icon: Icon(
                    Icons.brightness_2_outlined,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SearchScreen())));
                  },
                  icon: Icon(Icons.search))
            ],
            title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('News App'),
            ),
          ),
          body: cubit.screens[cubit.currntIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currntIndex,
            onTap: ((index) {
              cubit.changebuttom(index);
            }),
            items: cubit.Buttomitems,
          ),
        );
      },
    );
  }
}
