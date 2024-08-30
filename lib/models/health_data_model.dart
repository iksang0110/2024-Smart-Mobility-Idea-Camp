class HealthData {
  final String id;
  final String patientId;
  final DateTime date;
  final double bloodPressureSystolic;
  final double bloodPressureDiastolic;
  final double weight;
  final double bloodSugar;

  HealthData({
    required this.id,
    required this.patientId,
    required this.date,
    required this.bloodPressureSystolic,
    required this.bloodPressureDiastolic,
    required this.weight,
    required this.bloodSugar,
  });

  factory HealthData.fromJson(Map<String, dynamic> json) {
    return HealthData(
      id: json['id'],
      patientId: json['patientId'],
      date: DateTime.parse(json['date']),
      bloodPressureSystolic: json['bloodPressureSystolic'],
      bloodPressureDiastolic: json['bloodPressureDiastolic'],
      weight: json['weight'],
      bloodSugar: json['bloodSugar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'date': date.toIso8601String(),
      'bloodPressureSystolic': bloodPressureSystolic,
      'bloodPressureDiastolic': bloodPressureDiastolic,
      'weight': weight,
      'bloodSugar': bloodSugar,
    };
  }
}