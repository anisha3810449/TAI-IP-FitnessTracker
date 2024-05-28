import 'package:first_app/helpers.dart';
import 'package:flutter/material.dart';

class Steps extends StatelessWidget{
  const Steps({Key?  Key}): super(key: Key);

  @override
  Widget build(BuildContext context){

    String steps = formatNumber(randNumberBetween(3000, 6000));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(steps, style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900),),
          Text('Total steps', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, height: 2 ),),
        ],
      ),
    );
  }
}