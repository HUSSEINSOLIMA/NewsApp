// ignore_for_file: prefer_const_constructors, prefer_is_empty, non_constant_identifier_names, camel_case_types, avoid_print, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:News/DIO/dio_helper.dart';
import 'package:News/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NewsScreen/business.dart';
import '../NewsScreen/science.dart';
import '../NewsScreen/sports.dart';

class newsCubits extends Cubit<cubitStates> {
  newsCubits() : super(inialStates());

  static newsCubits get(context) => BlocProvider.of(context);
  int currntIndex = 0;
  List<BottomNavigationBarItem> Buttomitems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];
  List<Widget> screens = [
    business(),
    sports(),
    science(),
  ];
  void changebuttom(int index) {
    currntIndex = index;
    if (index == 1) getBusiness();
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(buttomNavStates());
  }

  List<dynamic> busines = [];
  void getBusiness() {
    emit(NewsBussinessGetLoading());
    if (busines.length == 0) {
      dioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '30832e797c864d8c994fb761b55bebff',
      }).then((value) {
        busines = value.data['articles'];
        // print(Sports[1]['title']);

        emit(NewsBusinessGetDAataSucsses());
      }).catchError((error) {
        print(error.toString());
        emit(NewsBusinessGetDAataError(error.toString()));
      });
    } else {
      emit(NewsBusinessGetDAataSucsses());
    }
  }

  List<dynamic> Sports = [];

  void getSports() {
    emit(NewsSportssGetLoading());
    if (Sports.length == 0) {
      dioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '30832e797c864d8c994fb761b55bebff',
      }).then((value) {
        Sports = value.data['articles'];
        // print(Sports[1]['title']);

        emit(NewsSportsGetDAataSucsses());
      }).catchError((error) {
        print(error.toString());
        emit(NewsSportsGetDAataError(error.toString()));
      });
    } else {
      emit(NewsSportsGetDAataSucsses());
    }
  }

  List<dynamic> Science = [];

  void getScience() {
    emit(NewsScienceGetLoading());
    if (Science.length == 0) {
      dioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '30832e797c864d8c994fb761b55bebff',
      }).then((value) {
        Science = value.data['articles'];
        print(Science[1]['title']);
        emit(NewsScienceGetDAataSucsses());
      }).catchError((error) {
        print(error.toString());
        emit(NewsScienceGetDAataError(error.toString()));
      });
    } else {
      emit(NewsScienceGetDAataSucsses());
    }
  }

  List<dynamic> Search = [];

  void getSearch(String? value) {
    emit(NewsSearchGetLoading());

    dioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '30832e797c864d8c994fb761b55bebff',
    }).then((value) {
      Search = value.data['articles'];
      // print(Science[1]['title']);
      emit(NewsSearchGetDAataSucsses());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchGetDAataError(error.toString()));
    });
    emit(NewsSearchGetDAataSucsses());
  }
}
