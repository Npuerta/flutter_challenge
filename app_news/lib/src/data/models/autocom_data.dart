class AutocomData {

  AutocomData({required this.data, required this.language});

  final List<String> data;
  final String language;

  factory AutocomData.fromList(List doc,String language)=> AutocomData(
    language: language,
    data: doc.map((val) => val as String).toList(),
  );

}