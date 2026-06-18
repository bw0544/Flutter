import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'map_screen.dart';
import 'compare_screen.dart';
import 'about_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController requestController = TextEditingController();

  String selectedAI = "GPT-5.2";
  String result = "🌍 Result will appear here";

  final List<String> aiModels = [
    "GPT-5.2",
    "GPT-5.3",
    "GPT-5.4",
    "Haiku 4.6",
    "Sonnet 4.6",
    "Opus 4.6",
    "Gemini 2.5 Flash",
    "Gemini 2.5 Pro",
    "Gemini 3.1 Pro",
  ];

  void calculate() {
    final text = textController.text;
    final requests = int.tryParse(requestController.text) ?? 1;

    final charCount = text.length;

    double e;
    double w;
    double c;

    switch (selectedAI) {
      case "GPT-5.2":
        e = 0.00052;
        w = 0.00021;
        c = 0.00032;
        break;

      case "GPT-5.3":
        e = 0.00055;
        w = 0.00023;
        c = 0.00034;
        break;

      case "GPT-5.4":
        e = 0.00060;
        w = 0.00026;
        c = 0.00036;
        break;

      case "Haiku 4.6":
        e = 0.00040;
        w = 0.00015;
        c = 0.00025;
        break;

      case "Sonnet 4.6":
        e = 0.00048;
        w = 0.00018;
        c = 0.00028;
        break;

      case "Opus 4.6":
        e = 0.00065;
        w = 0.00030;
        c = 0.00042;
        break;

      case "Gemini 2.5 Flash":
        e = 0.00035;
        w = 0.00012;
        c = 0.00020;
        break;

      case "Gemini 2.5 Pro":
        e = 0.00050;
        w = 0.00020;
        c = 0.00030;
        break;

      case "Gemini 3.1 Pro":
        e = 0.00070;
        w = 0.00030;
        c = 0.00045;
        break;

      default:
        e = 0.0005;
        w = 0.0002;
        c = 0.0003;
    }

    final energy = charCount * requests * e;
    final water = charCount * requests * w;
    final co2 = charCount * requests * c;

    setState(() {
      result = """
⚡ Energy: ${energy.toStringAsFixed(5)} kWh

💧 Water: ${water.toStringAsFixed(2)} ml

🌿 CO₂: ${co2.toStringAsFixed(2)} g
""";
    });
  }

  void _onNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const MapScreen(),
          ),
        );
        break;

      case 2:
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CompareScreen(),
          ),
        );
        break;

      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AboutScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040607),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: const Color(0xff040607),
        selectedItemColor: const Color(0xffBF40FA),
        unselectedItemColor: const Color(0xffE3D9FC),
        type: BottomNavigationBarType.fixed,
        onTap: _onNavTap,
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

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "⚡ AI Calculator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE3D9FC),
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xff5B2A62),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedAI,
                      dropdownColor: const Color(0xff040607),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff4928C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      items: aiModels.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedAI = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: textController,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter your text...",
                        hintStyle:
                        const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: const Color(0xff4928C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: requestController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Number of requests",
                        hintStyle:
                        const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: const Color(0xff4928C2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: calculate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xffBF40FA),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "⚡ Calculate",
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
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff0F1117),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xffBF40FA),
                  ),
                ),
                child: Text(
                  result,
                  style: const TextStyle(
                    color: Color(0xffE3D9FC),
                    fontSize: 16,
                    height: 1.7,
                  ),
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
                    backgroundColor:
                    const Color(0xffE3D9FC),
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
    );
  }
}