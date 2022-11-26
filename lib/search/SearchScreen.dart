// ignore_for_file: use_key_in_widget_constructors

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../resuableCompnents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubits, cubitStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var list = newsCubits.get(context).Search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      label: Text(
                        'Search',
                      ),
                      hintText: 'Tap To Search',
                    ),
                    onChanged: ((value) {
                      newsCubits.get(context).getSearch(value);
                    }),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search Must Be not Empty';
                      }
                      return null;
                    },
                  ),
                ),
                //  articleBuilder(list, context),
                Expanded(child: articleBuilder(list, context, isSearch: true)),
              ],
            ),
          );
        });
  }
}
