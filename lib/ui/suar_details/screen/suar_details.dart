import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/models/SuraModel.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (sura.isEmpty) {
      loadfile(suraModel.number);
    }

    return Scaffold(
      backgroundColor: colormanager.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          suraModel.suranameEN,
          style: TextStyle(
            color: colormanager.navbar,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: colormanager.navbar),
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
                      Image.asset(AssetsManager.leftcorner),
                      Text(
                        suraModel.suranameAR,
                        style: TextStyle(
                          color: colormanager.navbar,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(AssetsManager.rigthcorner),
                    ],
                  ),
                  Expanded(
                    //طالما السورة لسه ما اتحملتش (فاضية) → المفروض أظهر CircularProgressIndicator (اللودر).ولما السورة تبقى مليانة (مش فاضية) → أظهر Text بالسورة.
                    child: sura.isNotEmpty
                        ? SingleChildScrollView(
                            child: Text(
                              sura,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: colormanager.navbar,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.bottommosque),
        ],
      ),
    );
  }

  String sura = "";
  //variable ..empty string..تحط قيمه عندك في string
  loadfile(int suraNumber) async {
    String suraverses = await rootBundle.loadString(
      "assets/files/$suraNumber.txt",
    );
    List<String> lines = suraverses.split("\n"); //separate from any character
    for (int i = 0; i < lines.length; i++) {
      sura += lines[i];
      sura += "(${(i + 1)})";
    }
    setState(() {});
  }
}
