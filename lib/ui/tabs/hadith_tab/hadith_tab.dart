import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_project/core/resource/AssetsManager.dart';
import 'package:isalmi_project/core/resource/ColorManager.dart';
import 'package:isalmi_project/model/hadithmodel.dart';
import 'package:isalmi_project/ui/hadith_details/screen/hadith_details_screen.dart';
import 'package:isalmi_project/ui/tabs/hadith_tab/widget/hadithitem.dart';

class hadithtab extends StatefulWidget {
  @override
  State<hadithtab> createState() => _hadithtabState();
}

class _hadithtabState extends State<hadithtab> {
  PageController controller = PageController(viewportFraction: 0.8);

  //new
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readhAhadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: colormanager.background,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(AssetsManager.hadithback),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              AssetsManager.islami_logo,
              height: 180,
              fit: BoxFit.fitHeight,
            ),
            Expanded(
              child:ahadith.isEmpty?Center(child: CircularProgressIndicator(color: colormanager.navbar,),)
             : PageView.builder(
                controller: controller, //new
                itemBuilder: (context, index) => Hadithitem(ahadith[index]),
                itemCount: ahadith.length,
              ),
            ),
          ],
        ),
      );
  }

  List<HadithModel> ahadith = [];

  // حطتها برا عشان تبقا global
  readhAhadithFile() async {
    String data = await rootBundle.loadString(
      "assets/files/deepseek_text_20250801_a239b0.txt",
    );

    List<String> ahadithtext = data.split("#");

    for (int i = 0; i < ahadithtext.length; i++) {
      List<String> ahadithLines = ahadithtext[i].split("\n");

      // تأكد إن الحديث مش فاضي وإن فيه عنوان
      if (ahadithLines.isEmpty || ahadithLines[0].trim().isEmpty) continue;

      String title = ahadithLines[0];
      ahadithLines.removeAt(0);
      String content = ahadithLines.join(" ");
      HadithModel hadithModel = HadithModel(title: title, content: content,number: i+1);
      ahadith.add(hadithModel);
    }

    setState(() {});
  }
}
