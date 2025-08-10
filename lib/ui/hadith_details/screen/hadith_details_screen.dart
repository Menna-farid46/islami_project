import 'package:flutter/material.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/core/resource/StringManager.dart';
import 'package:isalmi_project/model/hadithmodel.dart';

import '../../../core/resource/AssetsManager.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeNames = "HadithDetails";

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: colormanager.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: colormanager.navbar),
        ),
        title: Text(
          "${StringManager.hadith} ${hadithModel.number}",
          style: TextStyle(
            color: colormanager.navbar,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AssetsManager.left_corner,
                        height: 92,
                        width: 92,
                      ),
                      Expanded(
                        child: Text(
                          hadithModel.title,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: colormanager.navbar,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Image.asset(
                        AssetsManager.right_corner,
                        height: 92,
                        width: 92,
                      ),
                    ],
                  ),
                  SizedBox(height: 17),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadithModel.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: colormanager.navbar,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            AssetsManager.bottom_mosque,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
