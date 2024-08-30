import 'package:flutter/material.dart';
import 'package:my_dialysis_app/views/user_type_selection_screen.dart';

class MedicalStaffHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의료진 홈'),
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
                '안녕하세요, Dr. Smith',
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
                      '환자 목록',
                      Icons.people,
                      () {
                        // TODO: Navigate to patient list screen
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '예약 관리',
                      Icons.calendar_today,
                      () {
                        // TODO: Navigate to appointment management screen
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '건강 데이터 분석',
                      Icons.bar_chart,
                      () {
                        // TODO: Navigate to health data analysis screen
                      },
                    ),
                    _buildMenuCard(
                      context,
                      '메시지',
                      Icons.message,
                      () {
                        // TODO: Navigate to messaging screen
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