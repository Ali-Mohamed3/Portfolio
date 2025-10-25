class Education {
  final String faculty;
  final String university;
  final String speciality;
  Education(this.faculty, this.speciality, this.university);
  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(json['faculty'], json['speciality'], json['university']);
  }
}
