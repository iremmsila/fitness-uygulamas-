

class Food{
  String name;
  String calories;
  String imagePath;


Food({
  required this.name,
  required this.calories,
  required this.imagePath,
});

String get _name => name;
String get _imagePath => imagePath;
String get _calories => calories;
}