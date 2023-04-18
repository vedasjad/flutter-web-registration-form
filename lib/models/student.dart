import 'dart:convert';

import 'package:flutter/foundation.dart';

class Student {
  static String name = '';
  static String email = '';
  static String stdno = '';
  static String year = "1st Year";
  static String branch = "CSE";
  static String section = "S1";
  static String phone = '';
  static List domain = [0, 0, 0, 0, 0];
  static String reCaptcha = '';
}

class User {
  final String name;
  final String email;
  final String stdno;
  final String year;
  final String branch;
  final String section;
  final String phone;
  final List domain;
  final String reCaptcha;

  User({
    required this.name,
    required this.email,
    required this.stdno,
    required this.year,
    required this.branch,
    required this.section,
    required this.phone,
    required this.domain,
    required this.reCaptcha,
  });

 

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'stdno': stdno});
    result.addAll({'year': year});
    result.addAll({'branch': branch});
    result.addAll({'section': section});
    result.addAll({'phone': phone});
    result.addAll({'domain': domain});
    result.addAll({'reCaptcha': reCaptcha});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      stdno: map['stdno'] ?? '',
      year: map['year'] ?? '',
      branch: map['branch'] ?? '',
      section: map['section'] ?? '',
      phone: map['phone'] ?? '',
      domain: List.from(map['domain']),
      reCaptcha: map['reCaptcha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? name,
    String? email,
    String? stdno,
    String? year,
    String? branch,
    String? section,
    String? phone,
    List? domain,
    String? reCaptcha,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      stdno: stdno ?? this.stdno,
      year: year ?? this.year,
      branch: branch ?? this.branch,
      section: section ?? this.section,
      phone: phone ?? this.phone,
      domain: domain ?? this.domain,
      reCaptcha: reCaptcha ?? this.reCaptcha,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, stdno: $stdno, year: $year, branch: $branch, section: $section, phone: $phone, domain: $domain, reCaptcha: $reCaptcha)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.name == name &&
      other.email == email &&
      other.stdno == stdno &&
      other.year == year &&
      other.branch == branch &&
      other.section == section &&
      other.phone == phone &&
      listEquals(other.domain, domain) &&
      other.reCaptcha == reCaptcha;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      stdno.hashCode ^
      year.hashCode ^
      branch.hashCode ^
      section.hashCode ^
      phone.hashCode ^
      domain.hashCode ^
      reCaptcha.hashCode;
  }
}
