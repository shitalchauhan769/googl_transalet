import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_translate/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class JsonAPI {
  static JsonAPI helper = JsonAPI._();

  JsonAPI._();

  Future<List<LangModel>> googleTranslateAPI() async {
    String? link = "assets/json/google.json";
    var jsonString = await rootBundle.loadString(link);
    List json = jsonDecode(jsonString);
    List<LangModel> langList = json.map((e) => LangModel.mapToModel(e)).toList();
    return langList;


  }
}

//String? link = "https://jsonplaceholder.typicode.com/posts";
//     var response = await http.get(Uri.parse(link));
//     if (response.statusCode == 200) {
//       List json = jsonDecode(response.body);
//       List<PostModel> postList =
//           json.map((e) => PostModel.mapToModel(e)).toList();
//       return postList;
//     }
//     return null;

// var jsonString = await rootBundle.loadString("assets/json/poste.json");
// List json1 =  jsonDecode(jsonString );
// List<PostModel>postList=json1.map((e) => PostModel.mapToModel(e)).toList();
// return postList;

//Future<Map> getLang()
//   async {
//     var result=await http.get(Uri.parse("https://translate-plus.p.rapidapi.com/"),headers: {
//       'X-RapidAPI-Key': '090af0fcf9msh052e8d02c1d238dp1f0666jsn5ff1fc6b8758',
//       'X-RapidAPI-Host': 'translate-plus.p.rapidapi.com',
//     });
//     if(result.statusCode==200)
//       {
//         var mainJson=await jsonDecode(result.body);
//         Map lMap=mainJson["supported_languages"];
//         return lMap;
//       }
//     return {};
//   }
// }
