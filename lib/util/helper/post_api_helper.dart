import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../home/model/home_model.dart';

class TranslateAPI {

  static TranslateAPI helper =TranslateAPI._();
  TranslateAPI._();

  Future<TranslateModel?> translateAPI({required String source,required String target,required String text}) async {
    String link = "https://translate-plus.p.rapidapi.com/translate";

    var response = await http.post(Uri.parse(link),
        body: jsonEncode({"text": text, "source": source, "target": target}), headers: {
        "x-rapidapi-key": "5c4d0680aamshfa88ef318dc926cp19bcc5jsn0b64cf84b9e9",
        "x-rapidapi-host": "translate-plus.p.rapidapi.com",
        "Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      TranslateModel m1 = TranslateModel.mapToModel(json);
      print("================================= model${m1.translation}");

      return m1;

    }
    return null;
  }
}
