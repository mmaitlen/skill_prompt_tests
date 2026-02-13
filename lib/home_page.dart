import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Signal<Color> selectedColor = signal(Colors.red);
  final Map<String, Color> _colors = {
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
    'Purple': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Existing widgets from main.dart
            const Text('bobdog was here'),
            const SizedBox(height: 20),
            const Text(
              'Mission Accomplished!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Powered by AI (and a lot of coffee, probably)',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Keep up the great work!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 40), // Spacing before new widgets
            
            // New widgets for color selection
            Watch((context) {
              return DropdownButton<Color>(
                value: selectedColor.value,
                onChanged: (Color? newValue) {
                  if (newValue != null) {
                    selectedColor.value = newValue;
                  }
                },
                items: _colors.entries
                    .map<DropdownMenuItem<Color>>((MapEntry<String, Color> entry) {
                      return DropdownMenuItem<Color>(
                        value: entry.value,
                        child: Text(entry.key),
                      );
                    }).toList(),
              );
            }),
            const SizedBox(height: 20),
            Watch((context) {
              return Container(
                width: 100,
                height: 100,
                color: selectedColor.value,
              );
            }),
          ],
        ),
      ),
    );
  }
}
