

import 'package:flutter/material.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';

import '../../../../core/resource/AssetsManager.dart';

class RecentlyQuranWidget extends StatelessWidget {
  const RecentlyQuranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: colormanager.navbar,),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20, left: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Al-Anbiya",
                  style: TextStyle(
                    color: colormanager.background,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "الأنبياء",
                  style: TextStyle(
                    color: colormanager.background,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "الأنبياء",
                  style: TextStyle(
                    color: colormanager.background,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AssetsManager.quransura),
        ],
      ),
    );
  }
}
