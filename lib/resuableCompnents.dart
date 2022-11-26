// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import, non_constant_identifier_names, sized_box_for_whitespace, file_names, curly_braces_in_flow_control_structures

import 'package:News/webView/webView.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

Widget BluidArctalItems(articles, context) => InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Webview(articles['url']))));
      }),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage("${articles['urlToImage']}"),

                    //whatever image you can put here

                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.start,

                    mainAxisSize: MainAxisSize.min,

                    // ignore: prefer_const_literals_to_create_immutables

                    children: [
                      Expanded(
                        child: Text(
                          '${articles['title']}',
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${articles['publishedAt']}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
Widget myDivider() => Divider(
      height: 1,
      color: Colors.grey,
    );
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              BluidArctalItems(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      condition: list.length > 0,
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

/*
Future<dynamic> launchUrl(articles) async {
  if (!await launchUrl('${articles['url']}')) {
    throw 'Could not launch ${articles['url']}';
  }
}
*/