class ImageModel {
  final String image;
  ImageModel(this.image);
  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(map['image']);
  }
}
