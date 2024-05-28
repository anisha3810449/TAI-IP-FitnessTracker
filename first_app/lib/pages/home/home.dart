// ignore: unused_import
//import 'dart:ffi';

import 'package:first_app/pages/home/widgets/activity.dart';
import 'package:first_app/pages/home/widgets/current.dart';
import 'package:first_app/pages/home/widgets/header.dart';
import 'package:first_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key?  Key}): super(key: Key);


  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        body: Column(
          children: [
            AppHeader(),
            CurrentProgram(),
            RecentActivities(),
            BottomNavigation(),
            ],
        ),
      );
  }

}