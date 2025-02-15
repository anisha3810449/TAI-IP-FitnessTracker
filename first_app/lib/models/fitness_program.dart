
import 'package:flutter/material.dart';

enum ProgramType{
  cardio,
  lift,
}

class FitnessProgram {
   final AssetImage image;
   final String name;
   final String cals;
   final String time;
   final ProgramType type;

   FitnessProgram({
   required this.image,
   required this.name,
   required this.cals,
   required this.time,
   required this.type,
   });
}

final List<FitnessProgram> fitnessProgram = [
  FitnessProgram(image: AssetImage('assets/running.jpg'), 
  name: 'Anisha', 
  cals: '220kcal', 
  time: '20min',
  type: ProgramType.cardio),

  FitnessProgram(image: AssetImage('assets/weight.jpg'), 
  name: 'Nilam', 
  cals: '220kcal', 
  time: '20min',
  type: ProgramType.lift),

];