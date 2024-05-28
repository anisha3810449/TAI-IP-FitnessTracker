// ignore: unused_import
import 'package:first_app/pages/details/widgets/stats.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget{
  const Info({Key?  Key}): super(key: Key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stats(value: '345',unit: 'kcal',label: 'Calories',),
        Stats(value: '3.6',unit: 'km',label: 'Distance',),
        Stats(value: '1.5',unit: 'hr',label: 'Hours',),

      ],
    );
  }
}



class Stats extends StatelessWidget{

  final String value;
  final String unit;
  final String label;

  const Stats({Key?  Key,
  required this.value,
  required this.unit,
  required this.label
  }): super(key: Key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: value, 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          children: [
            TextSpan(text: ' '),
            TextSpan(
              text: unit,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)
            )
          ]
          ),
        ),
        SizedBox(height: 6,),
        Text(label,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}