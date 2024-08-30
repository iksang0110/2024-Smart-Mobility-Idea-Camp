import 'package:flutter/material.dart';
import 'package:my_dialysis_app/models/appointment_model.dart';

class AppointmentScreen extends StatelessWidget {
  final List<Appointment> appointments = [
    Appointment(
      id: '1',
      dateTime: DateTime.now().add(Duration(days: 1)),
      patientId: '1',
      medicalStaffId: '2',
      status: AppointmentStatus.scheduled,
    ),
    Appointment(
      id: '2',
      dateTime: DateTime.now().add(Duration(days: 3)),
      patientId: '1',
      medicalStaffId: '3',
      status: AppointmentStatus.scheduled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약 관리'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                '예약 일시: ${_formatDate(appointment.dateTime)}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '상태: ${_getStatusString(appointment.status)}',
                style: TextStyle(color: _getStatusColor(appointment.status)),
              ),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.calendar_today, color: Colors.white),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Theme.of(context).primaryColor),
                onPressed: () {
                  // TODO: Implement appointment editing
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Implement new appointment creation
        },
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _getStatusString(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.scheduled:
        return '예약됨';
      case AppointmentStatus.inProgress:
        return '진행 중';
      case AppointmentStatus.completed:
        return '완료됨';
      case AppointmentStatus.cancelled:
        return '취소됨';
    }
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.scheduled:
        return Colors.blue;
      case AppointmentStatus.inProgress:
        return Colors.orange;
      case AppointmentStatus.completed:
        return Colors.green;
      case AppointmentStatus.cancelled:
        return Colors.red;
    }
  }
}