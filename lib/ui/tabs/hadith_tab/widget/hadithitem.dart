import 'package:flutter/material.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/ui/hadith_details/screen/hadith_details_screen.dart';
import 'package:isalmi_project/model/hadithmodel.dart';

class Hadithitem extends StatelessWidget {
  final HadithModel hadithModel;
//لازم اسال بشمهندس ليه عمل كدا حط final و constو super key
  const Hadithitem(this.hadithModel, {super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){Navigator.pushNamed(context,HadithDetailsScreen.routeNames,arguments: hadithModel);},
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 8,),
        decoration: BoxDecoration(
          color: colormanager.navbar,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Column(
                  children: [
                    Row(

                      children: [
                        Expanded(child: Image.asset(AssetsManager.hadith_left_corner)),
                        Expanded(
                          child: Text(
                            hadithModel.title,
                            textAlign:  TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: colormanager.background,
                            ),
                          ),
                        ),
                        Image.asset(AssetsManager.hadith_right_corner),
                      ],
                    ),

                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AssetsManager.hadith_card_back),
                          Text(
                            hadithModel.content,
                            maxLines: 13,//عدد السطور
                            overflow: TextOverflow.ellipsis,//يظهر النقط لو زاد عن عدد السطور اللي انا حطيته
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: colormanager.background,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Image.asset(
              AssetsManager.bottom_mosque,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
