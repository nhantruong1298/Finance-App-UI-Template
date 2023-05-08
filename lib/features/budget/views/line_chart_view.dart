part of 'budget_screen.dart';

class _LineChartView extends StatelessWidget {
  _LineChartView();
  static const _lineChartGradientColors = [const Color(0xFFB2D0CE)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.defaultPadding / 2),
      child: SizedBox(
        width: double.infinity,
        height: 250.h,
        child: LineChart(_lineChartDummyData),
      ),
    );
  }

  final _lineChartDummyData = LineChartData(
    gridData: FlGridData(show: false, drawVerticalLine: false),
    lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Color(0xFFB2D0CE).withOpacity(0.5),
            tooltipRoundedRadius: 8,
            tooltipPadding: EdgeInsets.all(5),
            getTooltipItems: (value) {
              return [
                LineTooltipItem('-${AppSymbol.usdSymbol}1,345\n JUNE 15,2020',
                    TextStyle(color: Colors.black, fontSize: 12.sp))
              ];
            })),
    titlesData: FlTitlesData(
      leftTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (context, value) =>
            TextStyle(color: Color(0xff68737d), fontSize: 13.sp),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Jul';
            case 2:
              return 'May';
            case 5:
              return 'Jun';
            case 8:
              return 'Jul';
            case 10:
              return 'May';
          }
          return '';
        },
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        colors: _lineChartGradientColors,
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: _lineChartGradientColors
              .map((color) => color.withOpacity(0.1))
              .toList(),
        ),
      ),
    ],
  );
}