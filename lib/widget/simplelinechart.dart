import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleLineChart extends StatefulWidget {
  const SimpleLineChart({super.key});

  @override
  State<SimpleLineChart> createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  int? touchedIndex;
  int selectedFilterIndex = 1;

  final filters = ["24h", "3d", "1w", "2w", "1m", "3m"];

  final List<List<FlSpot>> chartData = [
    [
      FlSpot(0, 2000),
      FlSpot(1, 3500),
      FlSpot(2, 3000),
      FlSpot(3, 2500),
      FlSpot(4, 1500),
    ],
    [
      FlSpot(0, 9500),
      FlSpot(1, 8500),
      FlSpot(2, 7800),
      FlSpot(3, 6000),
      FlSpot(4, 5265),
      FlSpot(5, 4800),
      FlSpot(6, 3000),
      FlSpot(7, 2000),
      FlSpot(8, 1500),
    ],
    [
      FlSpot(0, 1000),
      FlSpot(1, 3000),
      FlSpot(2, 5500),
      FlSpot(3, 7200),
      FlSpot(4, 9000),
    ],
    [
      FlSpot(0, 2000),
      FlSpot(1, 4000),
      FlSpot(2, 6000),
      FlSpot(3, 7000),
      FlSpot(4, 5000),
    ],
    [
      FlSpot(0, 1000),
      FlSpot(1, 3000),
      FlSpot(2, 7000),
      FlSpot(3, 9000),
      FlSpot(4, 8000),
    ],
    [
      FlSpot(0, 2500),
      FlSpot(1, 4500),
      FlSpot(2, 5500),
      FlSpot(3, 7000),
      FlSpot(4, 6000),
    ],
  ];

  final gridLines = [1000, 2000, 4000, 6000, 8000, 10000];

  bool _shouldDrawGrid(double value) =>
      gridLines.any((gridY) => (value - gridY).abs() < 0.001);

  @override
  Widget build(BuildContext context) {
    final selectedData = chartData[selectedFilterIndex];

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 500,
              maxY: 10500,
              borderData: FlBorderData(show: false),

              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return _shouldDrawGrid(value)
                      ? FlLine(
                          color: Colors.grey.shade300,
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        )
                      : FlLine(color: Colors.transparent);
                },
              ),

              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1000,
                    getTitlesWidget: (value, meta) {
                      if (_shouldDrawGrid(value)) {
                        return Text(
                          "${(value / 1000).round()}K",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  spots: selectedData,
                  isCurved: true,
                  color: Colors.redAccent,
                  barWidth: 3,
                  belowBarData: BarAreaData(show: false),

                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, bar, index) {
                      final isTouched = index == touchedIndex;
                      return isTouched
                          ? FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 3,
                              strokeColor: Colors.redAccent,
                            )
                          : FlDotCirclePainter(radius: 0);
                    },
                  ),
                ),
              ],

              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                touchCallback: (event, response) {
                  if (!event.isInterestedForInteractions ||
                      response?.lineBarSpots == null) {
                    setState(() => touchedIndex = null);
                  } else {
                    setState(
                      () => touchedIndex =
                          response!.lineBarSpots!.first.spotIndex,
                    );
                  }
                },
                touchTooltipData: LineTouchTooltipData(
                  tooltipBorderRadius: BorderRadius.circular(8),
                  tooltipPadding: const EdgeInsets.all(8),
                  getTooltipColor: (_) => Colors.redAccent,
                  getTooltipItems: (touchedSpots) => touchedSpots
                      .map(
                        (spot) => LineTooltipItem(
                          "\$${spot.y.toStringAsFixed(2)}",
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(filters.length, (i) {
            final isActive = i == selectedFilterIndex;
            return GestureDetector(
              onTap: () => setState(() => selectedFilterIndex = i),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: isActive ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  filters[i],
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
