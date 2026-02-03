import 'package:flutter/material.dart';

class FloatingActionButtonLocationExample extends StatelessWidget {
  const FloatingActionButtonLocationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButtonLocation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Example usage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('An object that defines a position for the FloatingActionButton based on the Scaffold\'s ScaffoldPrelayoutGeometry.'),
            const SizedBox(height: 16),
            const Text(
              'Documentation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SelectableText('https://api.flutter.dev/material/FloatingActionButtonLocation-class.html'),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'See the official docs for full usage details and parameters.',
            ),
          ],
        ),
      ),
    );
  }
}
