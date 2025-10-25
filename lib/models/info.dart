class Info {
  final String? info;
  Info(this.info);
  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(json['info']);
  }
}
