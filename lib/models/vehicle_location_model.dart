class VehicleLocation {
  final String id;
  final double latitude;
  final double longitude;
  final String vehicleId;
  final DateTime timestamp;

  VehicleLocation({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.vehicleId,
    required this.timestamp,
  });

  factory VehicleLocation.fromJson(Map<String, dynamic> json) {
    return VehicleLocation(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      vehicleId: json['vehicleId'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'vehicleId': vehicleId,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}