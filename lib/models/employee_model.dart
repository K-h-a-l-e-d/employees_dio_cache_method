// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Employee welcomeFromJson(String str) => Employee.fromJson(json.decode(str));

String welcomeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  String lastName;
  String phone;
  String firstName;
  DateTime birthDate;
  int salary;
  String department;
  DateTime createdAt;
  int id;
  String email;
  String address;
  String gender;
  int experience;
  bool isMarried;
  DateTime updatedAt;

  Employee({
    required this.lastName,
    required this.phone,
    required this.firstName,
    required this.birthDate,
    required this.salary,
    required this.department,
    required this.createdAt,
    required this.id,
    required this.email,
    required this.address,
    required this.gender,
    required this.experience,
    required this.isMarried,
    required this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        lastName: json["last_name"],
        phone: json["phone"],
        firstName: json["first_name"],
        birthDate: DateTime.parse(json["birth_date"]),
        salary: json["salary"],
        department: json["department"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        email: json["email"],
        address: json["address"],
        gender: json["gender"],
        experience: json["experience"],
        isMarried: json["is_married"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "last_name": lastName,
        "phone": phone,
        "first_name": firstName,
        "birth_date": birthDate.toIso8601String(),
        "salary": salary,
        "department": department,
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "email": email,
        "address": address,
        "gender": gender,
        "experience": experience,
        "is_married": isMarried,
        "updated_at": updatedAt.toIso8601String(),
      };
}
