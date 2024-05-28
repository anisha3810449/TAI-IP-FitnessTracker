import 'dart:math';

import 'package:flutter/material.dart';

class RecentActivities extends StatelessWidget{
  const RecentActivities({Key?  Key}): super(key: Key);

  @override
  Widget build(BuildContext context)
  {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Acitvities', 
            style: Theme.of(context).textTheme.headlineLarge
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ActivityItem(),),
            )
          ],
        ),
      )
    );
  }
}


class ActivityItem extends StatelessWidget{
  const ActivityItem({Key?  Key}): super(key: Key);

  static const activities = [
    'Running',
    'Swimming',
    'Hiking',
    'Walking',
    'Cycling',
  ];

  @override
  Widget build(BuildContext context)
  {

    String activitiy = activities[Random().nextInt(activities.length)];

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/details');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5,),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffe1e1e1),
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffcff2ff),
            ),
            height: 35,
            width: 35,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/running.jpg'),
                fit: BoxFit.fill,
                )
              ),
            ),
          ),
          SizedBox(width: 20,),
          Text(activitiy, style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900
            ),
            ),
            Expanded(child: SizedBox()),
            Icon(Icons.timer, size: 12,),
            Text('30min',
            style: TextStyle(fontSize: 10,
             fontWeight: FontWeight.w300 ),
            ),
            Icon(Icons.wb_sunny_outlined, size: 12),
            SizedBox(width: 5,),
            Text('55kcal',
            style: TextStyle(fontSize: 10,
            fontWeight: FontWeight.w300),
            ),
            SizedBox(width: 20,
            ),
        ],),
      ),
    );
  }
}