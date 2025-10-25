class Skills {
  final String? name;
  Skills(this.name);
  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(json["skill"]);
  }
}
