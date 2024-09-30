class TranslateModel {
  Translations? translations;

  TranslateModel({this.translations});

  TranslateModel.fromJson(Map<String, dynamic> json) {
    translations = json['translations'] != null ? new Translations.fromJson(json['translations']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.translations != null) {
      data['translations'] = this.translations!.toJson();
    }

    return data;
  }
}

class Translations {
  String? text;
  String? translation;
  String? source;
  String? target;

  Translations({this.text, this.translation, this.source, this.target});

  Translations.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    translation = json['translation'];
    source = json['source'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['translation'] = this.translation;
    data['source'] = this.source;
    data['target'] = this.target;
    return data;
  }
}






class LangModel {
  String? lang,s1,image;

  LangModel({this.lang, this.s1,this.image});
  factory LangModel.mapToModel(Map m1)
  {
    return LangModel(lang: m1["lang"],s1: m1["1"],image: m1['image']);
  }
}