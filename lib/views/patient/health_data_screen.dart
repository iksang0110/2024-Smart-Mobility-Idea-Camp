import 'package:flutter/material.dart';
import 'package:my_dialysis_app/models/health_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class HealthDataScreen extends StatelessWidget {
  final List<HealthData> healthDataList = [
    HealthData(
      id: '1',
      patientId: '1',
      date: DateTime.now().subtract(Duration(days: 7)),
      bloodPressureSystolic: 120,
      bloodPressureDiastolic: 80,
      weight: 70,
      bloodSugar: 100,
    ),
    HealthData(
      id: '2',
      patientId: '1',
      date: DateTime.now().subtract(Duration(days: 6)),
      bloodPressureSystolic: 118,
      bloodPressureDiastolic: 78,
      weight: 69.5,
      bloodSugar: 105,
    ),
    HealthData(
      id: '3',
      patientId: '1',
      date: DateTime.now().subtract(Duration(days: 5)),
      bloodPressureSystolic: 122,
      bloodPressureDiastolic: 82,
      weight: 69.8,
      bloodSugar: 98,
    ),
  ];

  HealthDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('건강 데이터'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHealthDataCard(
              context,
              '혈압',
              _createBloodPressureChart(),
              Icons.favorite,
              Colors.red,
            ),
            SizedBox(height: 24),
            _buildHealthDataCard(
              context,
              '체중',
              _createWeightChart(),
              Icons.line_weight,
              Colors.blue,
            ),
            SizedBox(height: 24),
            _buildHealthDataCard(
              context,
              '혈당',
              _createBloodSugarChart(),
              Icons.opacity,
              Colors.purple,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: 새로운 건강 데이터 추가 기능 구현
        },
      ),
    );
  }

  Widget _buildHealthDataCard(BuildContext context, String title, Widget chart, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: chart,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createBloodPressureChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: healthDataList.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.bloodPressureSystolic);
            }).toList(),
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: healthDataList.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.bloodPressureDiastolic);
            }).toList(),
            isCurved: true,
            color: Colors.red,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (double value, TitleMeta meta) {
                final date = healthDataList[value.toInt()].date;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateFormat('MM/dd').format(date),
                    style: const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(
                    color: Color(0xff67727d),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: healthDataList.length.toDouble() - 1,
        minY: 60,
        maxY: 140,
      ),
    );
  }

  Widget _createWeightChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: healthDataList.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.weight);
            }).toList(),
            isCurved: true,
            color: Colors.green,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (double value, TitleMeta meta) {
                final date = healthDataList[value.toInt()].date;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateFormat('MM/dd').format(date),
                    style: const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(
                    color: Color(0xff67727d),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: healthDataList.length.toDouble() - 1,
        minY: 65,
        maxY: 75,
      ),
    );
  }

  Widget _createBloodSugarChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: healthDataList.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.bloodSugar);
            }).toList(),
            isCurved: true,
            color: Colors.purple,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (double value, TitleMeta meta) {
                final date = healthDataList[value.toInt()].date;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateFormat('MM/dd').format(date),
                    style: const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(
                    color: Color(0xff67727d),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: healthDataList.length.toDouble() - 1,
        minY: 80,
        maxY: 120,
      ),
    );
  }
}