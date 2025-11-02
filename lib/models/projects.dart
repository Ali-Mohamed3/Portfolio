class Projects {
  final String? name;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? details;
  final String? repo;
  Projects(
    this.name,
    this.image1,
    this.image2,
    this.image3,
    this.details,
    this.repo,
  );
  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      json["name"],
      json['image1'],
      json['image2'],
      json['image3'],
      json['details'],
      json['github'],
    );
  }
}
