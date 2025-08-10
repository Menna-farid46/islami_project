import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/ui/into_screen/widget/Widget_intro.dart';
import '../../../models/class_intro/class_intro.dart';

class IntroScreen extends StatefulWidget {
  static const String routeNames = "intro";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pagecontroller = PageController();
  int currentPageIndex = 0;

  final List<Intro> introList = [
    Intro(
      image: AssetsManager.screen1,
      title: 'Welcome To Islami App',
      description: '',
    ),
    Intro(
      image: AssetsManager.screen2,
      title: 'Welcome To Islami',
      description: 'We are very excited to have you in our community',
    ),
    Intro(
      image: AssetsManager.screen3,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    Intro(
      image: AssetsManager.screen4,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    Intro(
      image: AssetsManager.screen5,
      title: 'Holy Quran Radio',
      description: 'You can listen to the Holy Quran Radio through the app for free',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colormanager.background,
      body:  Column(
          children: [
            // PageView
            Expanded(
              child: PageView.builder(
                controller: pagecontroller,
                itemCount: introList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) => WidgetIntro(intro: introList[index]),
              ),
            ),
        
             SizedBox(height: 24),
        
            // Row: Skip | Indicator | Next
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  GestureDetector(
                    onTap: () {
                      pagecontroller.previousPage (duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      );
                    },
                    child:  Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colormanager.navbar,
                      ),
                    ),
                  ),
        
                  // Smooth Page Indicator
                  SmoothPageIndicator(
                    controller: pagecontroller,
                    count: introList.length,
                    effect: SlideEffect(
                    activeDotColor: colormanager.navbar,
                    dotHeight: 10,
                    dotColor:Color(0xff707070),
                    dotWidth: 10,

                  ),
        
                    ),

                  // Next / Done Button
                  GestureDetector(
                    onTap: () {
                      if (currentPageIndex == introList.length - 1) {
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        pagecontroller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentPageIndex == introList.length - 1 ? "Done" : "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colormanager.navbar,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}
