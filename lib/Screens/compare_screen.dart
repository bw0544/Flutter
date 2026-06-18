import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'home_screen.dart';
import 'map_screen.dart';
import 'calculator_screen.dart';
import 'about_screen.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  String aiA = "🤖 GPT-5.2";
  String aiB = "🤖 GPT-5.3";
  String metric = "⚡ Energy";

  double valueA = 0.48;
  double valueB = 0.45;

  final aiModels = [
    "🤖 GPT-5.2",
    "🤖 GPT-5.3",
    "🤖 GPT-5.4",
    "🧠 Haiku 4.6",
    "🎭 Sonnet 4.6",
    "🔥 Opus 4.6",
    "⚡ Gemini 2.5 Flash",
    "🚀 Gemini 2.5 Pro",
    "🌌 Gemini 3.1 Pro",
  ];

  final metrics = [
    "⚡ Energy",
    "💧 Water",
    "🌍 CO2",
  ];

  double getValue(String ai, String metric) {
    final values = switch (ai) {
      "🤖 GPT-5.2" => (0.48, 0.32, 0.40),
      "🤖 GPT-5.3" => (0.45, 0.30, 0.37),
      "🤖 GPT-5.4" => (0.42, 0.28, 0.33),
      "🧠 Haiku 4.6" => (0.38, 0.25, 0.30),
      "🎭 Sonnet 4.6" => (0.41, 0.27, 0.34),
      "🔥 Opus 4.6" => (0.50, 0.34, 0.42),
      "⚡ Gemini 2.5 Flash" => (0.35, 0.22, 0.25),
      "🚀 Gemini 2.5 Pro" => (0.40, 0.26, 0.32),
      "🌌 Gemini 3.1 Pro" => (0.55, 0.36, 0.45),
      _ => (0.45, 0.30, 0.40),
    };

    return switch (metric) {
      "⚡ Energy" => values.$1,
      "💧 Water" => values.$2,
      _ => values.$3,
    };
  }

  void compare() {
    setState(() {
      valueA = getValue(aiA, metric);
      valueB = getValue(aiB, metric);
    });
  }

  // متد جابه‌جایی بین صفحات برای BottomNavigationBar
  void _onNavTap(BuildContext context, int index) {
    if (index == 3) return; // در حال حاضر روی همین صفحه (Compare) هستیم

    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = const HomeScreen();
        break;
      case 1:
        nextScreen = const MapScreen();
        break;
      case 2:
        nextScreen = const CalculatorScreen();
        break;
      case 4:
        nextScreen = const AboutScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040607),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "📊 AI Comparison",
                style: TextStyle(
                  color: Color(0xffE3D9FC),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xff5B2A62),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: aiA,
                      dropdownColor: const Color(0xff040607),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff4928C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      items: aiModels
                          .map(
                            (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                          .toList(),
                      onChanged: (v) => setState(() => aiA = v!),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: aiB,
                      dropdownColor: const Color(0xff040607),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff4928C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      items: aiModels
                          .map(
                            (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                          .toList(),
                      onChanged: (v) => setState(() => aiB = v!),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: metric,
                      dropdownColor: const Color(0xff040607),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff4928C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      items: metrics
                          .map(
                            (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                          .toList(),
                      onChanged: (v) => setState(() => metric = v!),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: compare,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffBF40FA),
                          foregroundColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "⚡ Compare",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 450,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xff0F1117),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xffBF40FA),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      metric,
                      style: const TextStyle(
                        color: Color(0xffE3D9FC),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          valueA.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Color(0xffBF40FA),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          valueB.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Color(0xff4928C2),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          maxY: 0.8,
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: 0.1,
                          ),
                          titlesData: FlTitlesData(
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toStringAsFixed(1),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 55,
                                getTitlesWidget: (value, meta) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return Text(
                                        aiA,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      );
                                    case 1:
                                      return Text(
                                        aiB,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: valueA,
                                  width: 70,
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff5B2A62),
                                      Color(0xffBF40FA),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: valueB,
                                  width: 70,
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff4928C2),
                                      Color(0xffE3D9FC),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE3D9FC),
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    "⬅ Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // قرارگیری درست BottomNavigationBar در بدنه اصلی Scaffold
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // این صفحه گزینه‌ی چهارم (Compare) در لیست شماست
        backgroundColor: const Color(0xff040607),
        selectedItemColor: const Color(0xffBF40FA),
        unselectedItemColor: const Color(0xffE3D9FC),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _onNavTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calc",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Compare",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
        ],
      ),
    );
  }
}