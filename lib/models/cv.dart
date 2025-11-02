class Cv {
  final String name;
  final String url;
  Cv(this.name, this.url);
  factory Cv.fromMap(Map<String, dynamic> map) {
    return Cv(map['name'], map['link']);
  }
}
