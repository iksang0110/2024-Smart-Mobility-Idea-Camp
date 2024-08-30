import 'package:flutter/material.dart';
import 'package:my_dialysis_app/views/patient/home_screen.dart';
import 'package:my_dialysis_app/views/medical_staff/home_screen.dart';
import 'package:my_dialysis_app/views/vehicle_manager/home_screen.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사용자 유형 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('환자'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PatientHomeScreen()),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('의료진'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MedicalStaffHomeScreen()),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('차량 관리자'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => VehicleManagerHomeScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}