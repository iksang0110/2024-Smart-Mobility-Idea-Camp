import 'package:flutter/material.dart';

class Appointment {
  final String id;
  final DateTime dateTime;
  final String patientId;
  final String medicalStaffId;
  final AppointmentStatus status;

  Appointment({
    required this.id,
    required this.dateTime,
    required this.patientId,
    required this.medicalStaffId,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      dateTime: DateTime.parse(json['dateTime']),
      patientId: json['patientId'],
      medicalStaffId: json['medicalStaffId'],
      status: AppointmentStatus.values.firstWhere(
        (e) => e.toString() == 'AppointmentStatus.${json['status']}',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateTime': dateTime.toIso8601String(),
      'patientId': patientId,
      'medicalStaffId': medicalStaffId,
      'status': status.toString().split('.').last,
    };
  }
}

enum AppointmentStatus { scheduled, inProgress, completed, cancelled }