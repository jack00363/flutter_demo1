

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

AppBar getTitleAppBar(String title){
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 28
      ),
    ),
    backgroundColor: MyColor().Myblue,
  );
}