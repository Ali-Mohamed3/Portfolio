import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/certificates.dart';
import 'package:my_portfolio/models/contact.dart';
import 'package:my_portfolio/models/description.dart';
import 'package:my_portfolio/models/education.dart';
import 'package:my_portfolio/models/info.dart';
import 'package:my_portfolio/models/programming_langs.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/models/skills.dart';
import 'package:my_portfolio/models/tools_apps.dart';

class FirestoreController {
  final db = FirebaseFirestore.instance;
  Stream<Description> getDescription() {
    return db.collection('Description').snapshots().map((snapshot) {
      return Description.fromJson(snapshot.docs.first.data());
    });
  }

  Stream<Education> getEducation() {
    return db.collection('Education').snapshots().map((snapshot) {
      return Education.fromJson(snapshot.docs.first.data());
    });
  }

  Stream<Info> getInfo() {
    return db.collection('info').snapshots().map((snapshot) {
      return Info.fromJson(snapshot.docs.first.data());
    });
  }

  Stream<List<ProgrammingLangs>> getLangs() {
    return db.collection('programming languages').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProgrammingLangs.fromJson(doc.data());
      }).toList();
    });
  }

  Stream<List<ToolsApps>> getTools() {
    return db.collection('Tools').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ToolsApps.fromJson(doc.data());
      }).toList();
    });
  }

  Stream<List<Skills>> getSkills() {
    return db.collection('skills').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Skills.fromJson(doc.data());
      }).toList();
    });
  }

  Stream<List<Projects>> getProjects() {
    return db.collection('projects').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Projects.fromJson(doc.data());
      }).toList();
    });
  }

  Stream<List<Certificates>> getCertificates() {
    return db.collection('Certificates').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Certificates.fromJson(doc.data());
      }).toList();
    });
  }

  Stream<List<Contact>> getContacs() {
    return db.collection('contact').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Contact.fromJson(doc.data());
      }).toList();
    });
  }
}
