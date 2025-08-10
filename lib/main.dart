import 'package:flutter/material.dart';
import 'package:isalmi_project/ui/hadith_details/screen/hadith_details_screen.dart';
import 'package:isalmi_project/ui/home/screen/homesreen.dart';
import 'package:isalmi_project/ui/into_screen/screen/intro_screen.dart';
import 'package:isalmi_project/ui/suar_details/screen/suar_details.dart';

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
      initialRoute:IntroScreen.routeNames,
      routes: {
        Homescreen.routeNames:(context)=>Homescreen(),
        HadithDetailsScreen.routeNames:(_)=>HadithDetailsScreen(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        IntroScreen.routeNames:(context)=>IntroScreen()

      },

    );
  }
}

