// ignore_for_file: prefer_const_constructors, camel_case_types, implementation_imports

import 'package:News/cubit/cubit.dart';
import 'package:News/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resuableCompnents.dart';

class science extends StatelessWidget {
  const science({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubits, cubitStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var list = newsCubits.get(context).Science;
        return articleBuilder(list, context);
      },
    );
  }
}
