import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isalmi_project/core/resource/Appconst.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/models/SuraModel.dart';
import 'package:isalmi_project/ui/suar_details/screen/suar_details.dart';

class SuraWidget extends StatelessWidget {
  SuraModel suraModel;
  SuraWidget( this.suraModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:(){
      Navigator.pushNamed(context, SuraDetails.routeName,arguments: suraModel);
    } ,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.suranum),
              Text(
                suraModel.number.toString(),
                style: TextStyle(
                  color: colormanager.whitecolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraModel.suranameEN,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${suraModel.verse} verses ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),//spacer vs expanded
          Text(
            suraModel.suranameAR,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
