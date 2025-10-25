class ProgrammingLangs {
  final String? name;
  ProgrammingLangs(this.name);
  factory ProgrammingLangs.fromJson(Map<String, dynamic> json) {
    return ProgrammingLangs(json["programming language"]);
  }
}
