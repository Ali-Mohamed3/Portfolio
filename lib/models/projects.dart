class Projects {
  final String? name;
  final String? image;
  final String? track;

  Projects(this.name, this.image, this.track);
  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(json["project name"], json['image'], json['track']);
  }
}
