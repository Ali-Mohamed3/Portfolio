class Certificates {
  final String? image;
  Certificates(this.image);
  factory Certificates.fromJson(Map<String, dynamic> json) {
    return Certificates(json['image']);
  }
}
