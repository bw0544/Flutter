import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'calculator_screen.dart';
import 'compare_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040607),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: const Color(0xff040607),
        selectedItemColor: const Color(0xffBF40FA),
        unselectedItemColor: const Color(0xffE3D9FC),
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          switch (index) {
            case 0:
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CalculatorScreen(),
                ),
              );
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
        },

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(height: 70),

              const Icon(
                Icons.auto_awesome,
                color: Color(0xffBF40FA),
                size: 60,
              ),

              const SizedBox(height: 20),

              const Text(
                "Aionia",
                style: TextStyle(
                  color: Color(0xffE3D9FC),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "AI Sustainability Platform",
                style: TextStyle(
                  color: Color(0xffBF40FA),
                  fontSize: 14,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 40),

              _menuButton(
                "🗺 Map",
                const Color(0xff4928C2),
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MapScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _menuButton(
                "⚡ Calculator",
                const Color(0xffBF40FA),
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CalculatorScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _menuButton(
                "📊 Compare",
                const Color(0xff5B2A62),
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CompareScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _menuButton(
                "ℹ About",
                const Color(0xffE3D9FC),
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AboutScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _menuButton(
      String title,
      Color color,
      VoidCallback onTap,
      ) {
    final bool isLightButton = color == const Color(0xffE3D9FC);

    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 12,
          shadowColor: color.withOpacity(0.6),
          backgroundColor: color,
          foregroundColor:
          isLightButton ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}