import 'package:flutter/material.dart';
import 'package:isalmi_project/ui/home/screen/homesreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme:NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(TextStyle(color: Colors.white))
        ) ,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute:Homescreen.routeNames,
      routes: {
        Homescreen.routeNames:(context)=>Homescreen()
      },

    );
  }
}

