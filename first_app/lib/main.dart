import 'package:first_app/pages/details/widgets/details.dart';
import 'package:first_app/pages/home/home.dart';
//import 'package:first_app/pages/home/home.dart';
//import 'package:first_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  //change
  const MyApp({Key?  Key}): super(key: Key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness tracker',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(headlineLarge: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w900
        ))
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
      initialRoute: '/',
     
    );
  }
} 