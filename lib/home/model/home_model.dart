class TranslateModel
{
  String? source,target,text;

  TranslateModel({this.source, this.target, this.text});

  factory TranslateModel.mapTOModel(Map m1)
  {
    return TranslateModel(text: m1['text'],source: m1['source'],target: m1['target']);
  }
}

class DetailsModel
{
  String? details;

  DetailsModel({this.details});
}


class LangModel{
  String? lang,s1;

  LangModel({this.lang, this.s1});
  factory LangModel.mapToModel(Map m1)
  {
    return LangModel(lang: m1["lang"],s1: m1["1"]);
  }
}