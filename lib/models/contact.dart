class Contact {
  final String? email;
  final String? message;
  Contact(this.email, this.message);
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(json["email address"], json['message']);
  }
}
