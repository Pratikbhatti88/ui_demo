import 'package:flutter/material.dart';

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

EdgeInsets devicePadding(BuildContext context) => MediaQuery.of(context).padding;

double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;
