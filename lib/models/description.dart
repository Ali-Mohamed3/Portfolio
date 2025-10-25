class Description {
  final String? name;
  Description(this.name);
  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(json['description']);
  }
}
