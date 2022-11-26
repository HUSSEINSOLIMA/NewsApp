// ignore_for_file: prefer_const_constructors, implementation_imports, unused_import, duplicate_import, camel_case_types

import 'package:News/cubit/cubit.dart';
import 'package:News/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resuableCompnents.dart';

class sports extends StatelessWidget {
  const sports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubits, cubitStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var list = newsCubits.get(context).Sports;
        return articleBuilder(list, context);
      },
    );
  }
}
