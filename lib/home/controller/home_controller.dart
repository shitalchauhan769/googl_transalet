import 'package:get/get.dart';
import 'package:google_translate/home/model/home_model.dart';
import 'package:google_translate/util/helper/json_api_helper.dart';
import 'package:google_translate/util/helper/post_api_helper.dart';

class HomeController extends GetxController {
  RxList<LangModel> langList = <LangModel>[].obs;
  Rxn<TranslateModel> model = Rxn();
  String source = "en", target = "gu", text = "";
  RxString index = "Gujarati".obs;
  RxString lanIndex="English".obs;
  RxString index1="gu".obs;
  RxString lanIndex1="en".obs;
  RxString imageIndex="https://media.istockphoto.com/id/1051236720/vector/vector-flag-of-the-republic-of-india-proportion-2-3-the-national-flag-of-india-tricolor.jpg?s=612x612&w=0&k=20&c=vcZ3ssSitwTXLGOjA9_8FJ951MCNdSsF-DOHyrb58vA=".obs;
  RxString imageIndex1="https://cdn.pixabay.com/photo/2015/11/06/13/29/union-jack-1027898_1280.jpg".obs;



  Future<void> getLanguage() async {
    langList.value = await JsonAPI.helper.googleTranslateAPI();
  }

  void getTranslate( String txtText, String source, String target,) async {
    // print("============================text${txtText}");
    // print("============================source${source}");
    // print("============================target${target}");
    // // print(model.value!.target);
    // // print(model.value!.source);
    model.value= await TranslateAPI.helper.translateAPI(source,target,txtText);

  }


}
