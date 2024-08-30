import 'package:flutter/material.dart';
import 'package:my_dialysis_app/views/user_type_selection_screen.dart';

class VehicleManagerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('차량 관리자 홈'),
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
                '안녕하세요, 김관리님',
                style: Theme.of(context).textTheme.headlineSmall,
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
                      '차량 위치',
                      Icons.location_on,
                      () {
                        // TODO: Navigate to vehicle location screen
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '운행 일정',
                      Icons.schedule,
                      () {
                        // TODO: Navigate to schedule management screen
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '차량 상태',
                      Icons.directions_car,
                      () {
                        // TODO: Navigate to vehicle status screen
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '보고서',
                      Icons.assessment,
                      () {
                        // TODO: Navigate to reports screen
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

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}