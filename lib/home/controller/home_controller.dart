import 'package:get/get.dart';
import 'package:google_translate/home/model/home_model.dart';
import 'package:google_translate/util/helper/json_api_helper.dart';
import 'package:google_translate/util/helper/post_api_helper.dart';

class HomeController extends GetxController {
  RxList<LangModel> langList = <LangModel>[].obs;
  Future<TranslateModel?>? model;
  String source = "en", target = "gu", text = "";
  RxString index = "Gujarati".obs;
  RxString lanIndex="English".obs;



  Future<void> getLanguage() async {
    langList.value = await JsonAPI.helper.googleTranslateAPI();
  }

  void getTranslate({required String txtText,required String source,required String target,}) {

    text = txtText;
    model = TranslateAPI.helper
        .translateAPI(source: source, target: target, text: txtText);
    print("==========================$txtText");
    print("======================$source");
    print("======================$target");
  }


}
