import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/core/resource/StringManager.dart';
import 'package:isalmi_project/ui/tabs/hadith_tab/hadith_tab.dart';
import 'package:isalmi_project/ui/tabs/quran_tabs/quran_tab.dart';
import 'package:isalmi_project/ui/tabs/radio_tab/radio_tab.dart';
import 'package:isalmi_project/ui/tabs/sebha_tab/sebha_tab.dart';
import 'package:isalmi_project/ui/tabs/time_tab/time_tab.dart';

class Homescreen extends StatefulWidget {
  static const String routeNames = "home";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget>tabs=[
    qurantab(),
    hadithtab(),
    sebhatab(),
    radiotab(),
    timetab(),
  ];
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colormanager.background,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: colormanager.background.withOpacity(0.6),
        backgroundColor: colormanager.navbar,
        selectedIndex:selectedindex ,
        onDestinationSelected: (value) {
          setState(() {
            selectedindex = value;

          });
        },

        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.quranicon),
            label: StringManager.quran,
            selectedIcon: SvgPicture.asset(AssetsManager.quranselected),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.hadithicon),
            label: StringManager.hadith,
            selectedIcon: SvgPicture.asset(AssetsManager.hadithselected),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.sebhaicon),
            label: StringManager.sebha,
            selectedIcon: SvgPicture.asset(AssetsManager.sebhaselected),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.radioicon),
            label: StringManager.radio,
            selectedIcon: SvgPicture.asset(AssetsManager.radioselected),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.timeicon),
            label: StringManager.time,
            selectedIcon: SvgPicture.asset(AssetsManager.timeselected),
          ),
        ],
      ),
      body: tabs[selectedindex],
    );
  }
}
