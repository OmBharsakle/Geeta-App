class GeetaModal
{
  late String number,title,image,subTitle;
  late Languages languages;

  GeetaModal({required this.number,required this.title,required this.image,required this.languages,required this.subTitle});

  factory GeetaModal.fromJson(Map m1)
  {
    return GeetaModal(languages: Languages.fromLanguages(m1['languages']), number: m1['number'],image: m1['image'],title: m1['title'],subTitle: m1['subTitle']);
  }
}

class Languages
{
  late List english;
  late List hindi;
  late List gujarati;
  late List sanskrit;

  Languages({required this.english,required this.hindi,required this.gujarati,required this.sanskrit});
  factory Languages.fromLanguages(Map m1)
  {
    return Languages(english: m1['english'], hindi: m1['hindi'], gujarati: m1['gujarati'], sanskrit: m1['sanskrit']);
  }
}