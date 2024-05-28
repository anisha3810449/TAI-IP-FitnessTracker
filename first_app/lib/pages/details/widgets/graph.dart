// ignore_for_file: unused_local_variable

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Graph extends StatelessWidget{
  const Graph({Key?  Key}): super(key: Key);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: SizedBox(
      width: double.infinity,
      height: 200,
      child: GraphArea(),
      ),
    );
  }
}


class GraphArea extends StatefulWidget{
  const GraphArea({Key?  Key}): super(key: Key);
  
  @override
  GraphAreaState createState()  =>  GraphAreaState();
}

class GraphAreaState extends State<GraphArea> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  List<DataPoint> data = [
    DataPoint(day: 1, steps: Random().nextInt(100)),
    DataPoint(day: 2, steps: Random().nextInt(100)),
    DataPoint(day: 3, steps: Random().nextInt(100)),
    DataPoint(day: 4, steps: Random().nextInt(100)),
    DataPoint(day: 5, steps: Random().nextInt(100)),
    DataPoint(day: 6, steps: Random().nextInt(100)),
    DataPoint(day: 7, steps: Random().nextInt(100)),
    DataPoint(day: 8, steps: Random().nextInt(100)),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: (){
        _animationController.forward(from: 0.0);
      },
      child: CustomPaint(
        painter: GraphPainter(_animationController.view ,data: data),
      ),
    );
  }
}


class GraphPainter extends CustomPainter{

  final List<DataPoint> data;
  final Animation<double> _size;
  final Animation<double> _dotSize;

  GraphPainter(Animation<double> animation, {required this.data})
  : _size = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, 
  curve: Interval(0.0, 0.75, curve: Curves.easeInOutCubicEmphasized)),
  ),

  _dotSize = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, 
  curve: Interval(0.75, 1, curve: Curves.easeInOutCubicEmphasized)),
  ),
  super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var xSpacing = size.width / (data.length - 1);

    var maxSteps = data.fold<DataPoint>(data[0], (p, c) => p.steps > c.steps ? p : c)
    .steps;

    var yRatio  = size.height / maxSteps;
    var curvedOffset = xSpacing * 0.3;

    List<Offset> offsets = [];

    var cx = 0.0;
    for (int i=0; i< data.length; i++){

      var y = size.height - (data[i].steps * yRatio * _size.value);

      offsets.add(Offset(cx, y));
      cx += xSpacing;
    }

    Paint linePaint = Paint()
    ..color = Color(0xff30c3f9)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0;

    Paint shadowPaint = Paint()
    ..color = Color(0xff30c3f9)
    ..style = PaintingStyle.stroke
    ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.solid, 3)
    ..strokeWidth = 3.0;

    Paint fillPaint = Paint()
    ..shader = ui.Gradient.linear(Offset(size.width /2 ,0), 
    Offset(size.width / 2, size.height), 
    [
      Color(0xff30c3f9),
      Colors.white,

    ],
    )
    ..color = Colors.black
    ..style = PaintingStyle.fill
    ..strokeWidth = 3.0;

    Paint dotOutlinePaint = Paint()
    ..color = Colors.white.withAlpha(200)
    ..strokeWidth  = 9;

    Paint dotCenter = Paint()
    ..color = Color(0xff30c3f9)
    ..strokeWidth = 8;


    Path linePath = Path();
    Offset cOffset  = offsets[0];

    linePath.moveTo(cOffset.dx, cOffset.dy);

    for (int i = 1; i < offsets.length; i++){

      var x  = offsets[i].dx;
      var y  = offsets[i].dy;
      var c1x = cOffset.dx + curvedOffset;
      var c1y = cOffset.dy;
      var c2x = x - curvedOffset;
      var c2y = y;

      linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
      cOffset = offsets[i];

    }
    
    //linePath.lineTo(size.width, size.height);

    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, linePaint);
    canvas.drawPath(linePath, linePaint);

    canvas.drawCircle(offsets[4], 15 * _dotSize.value, dotOutlinePaint);
    canvas.drawCircle(offsets[4], 6 * _dotSize.value, dotCenter);
   
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {
    return data != oldDelegate.data;
  }
  
}




class DataPoint {
  final int day;
  final int steps;

  DataPoint({
    required this.day,
    required this.steps,
  });
}