import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isalmi_project/core/resource/Appconst.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/core/resource/StringManager.dart';
import 'package:isalmi_project/ui/tabs/quran_tabs/widget/RecentlyQuranWidget.dart';
import 'package:isalmi_project/ui/tabs/quran_tabs/widget/surawidget.dart';

class qurantab extends StatelessWidget {
  const qurantab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(top: 30, right: 20, left: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranback),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(AssetsManager.logo, fit: BoxFit.fitHeight),
          ),
          SizedBox(height: 21),
          TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: colormanager.whitecolor),
              hintText: StringManager.suraname,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 56,
                maxWidth: 56,
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: SvgPicture.asset(AssetsManager.prefixicon),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colormanager.navbar),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colormanager.navbar),
              ),
              filled: true,
              fillColor: colormanager.background.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringManager.mostrecently,
              style: TextStyle(
                color: colormanager.whitecolor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RecentlyQuranWidget(),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringManager.suralist,
              style: TextStyle(
                color: colormanager.whitecolor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.separated(
              itemBuilder: (context, index) => SuraWidget(suras[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: suras.length,
            ),
          ),
        ],
      ),
    );
  }
}
