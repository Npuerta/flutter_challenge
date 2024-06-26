class Condition {
    final String text;
    final String icon;

    Condition({
        required this.text,
        required this.icon,
    });

factory  Condition.fromJson(Map<String,dynamic> json) => Condition(
  icon:  json['icon'],
  text: json['text'],
); 

}