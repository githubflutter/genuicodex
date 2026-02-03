import 'package:flutter/material.dart';

class DropRangeSliderValueIndicatorShapeExample extends StatelessWidget {
  const DropRangeSliderValueIndicatorShapeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropRangeSliderValueIndicatorShape'),
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
            Text('The shape of a Material 3 RangeSlider\'s value indicators.'),
            const SizedBox(height: 16),
            const Text(
              'Documentation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SelectableText('https://api.flutter.dev/material/DropRangeSliderValueIndicatorShape-class.html'),
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
