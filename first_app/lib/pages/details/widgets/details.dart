
import 'package:first_app/pages/details/widgets/appbar.dart';
import 'package:first_app/pages/details/widgets/dates.dart';
import 'package:first_app/pages/details/widgets/graph.dart';
import 'package:first_app/pages/details/widgets/info.dart' hide Stats;
import 'package:first_app/pages/details/widgets/stats.dart';
import 'package:first_app/pages/details/widgets/steps.dart';
import 'package:first_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget{
  const DetailsPage({Key?  Key}): super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(appBar: AppBar()),
      body: Column(
        children: const[
          Dates(),
          Steps(), 
          Graph(),
          Info(),
          Divider(height: 30,),
          Stats(),
          SizedBox(height: 30,),
          BottomNavigation(),
        ],
      ),
    );
  }
}
