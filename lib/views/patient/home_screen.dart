import 'package:flutter/material.dart';
import 'package:my_dialysis_app/views/patient/appointment_screen.dart';
import 'package:my_dialysis_app/views/patient/health_data_screen.dart';
import 'package:my_dialysis_app/views/patient/vehicle_tracking_screen.dart';
import 'package:my_dialysis_app/views/user_type_selection_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('환자 홈'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserTypeSelectionScreen()),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '안녕하세요, 홍길동님',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '오늘도 건강한 하루 되세요!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildMenuCard(
                      context,
                      '예약 관리',
                      Icons.calendar_today,
                      Colors.blue,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppointmentScreen()),
                      ),
                    ),
                    _buildMenuCard(
                      context,
                      '건강 데이터',
                      Icons.favorite,
                      Colors.red,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HealthDataScreen()),
                      ),
                    ),
                    _buildMenuCard(
                      context,
                      '차량 위치',
                      Icons.location_on,
                      Colors.green,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleTrackingScreen()),
                      ),
                    ),
                    _buildMenuCard(
                      context,
                      '의료진 상담',
                      Icons.chat,
                      Colors.orange,
                      () {
                        // TODO: Implement medical consultation feature
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}