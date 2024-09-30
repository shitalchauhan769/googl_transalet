import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../home/model/home_model.dart';

class TranslateAPI {

  static TranslateAPI helper =TranslateAPI._();
  TranslateAPI._();

  Future<TranslateModel?> translateAPI(String source, String target, String text) async {
    String link = "https://translate-plus.p.rapidapi.com/translate";


 // print("==============$source $target $text");
    var response = await http.post(Uri.parse(link),

        body: jsonEncode({"text": text, "source": source, "target": target}), headers: {

        "x-rapidapi-key": "5c4d0680aamshfa88ef318dc926cp19bcc5jsn0b64cf84b9e9",
        "x-rapidapi-host": "translate-plus.p.rapidapi.com",
        "Content-Type": "application/json"});
    // print("=======================response${response.body}");
    // print("=======================response1  ${response.statusCode}");

    if (response.statusCode == 200) {
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      // print("========================== json ${json}");
      TranslateModel m1 = TranslateModel.fromJson(json);
      // print("========================= model ${m1.translations!.translation}");

      return m1;
    }
    return null;
  }
}
