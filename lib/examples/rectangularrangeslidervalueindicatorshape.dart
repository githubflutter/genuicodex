import 'package:flutter/material.dart';

class RectangularRangeSliderValueIndicatorShapeExample extends StatelessWidget {
  const RectangularRangeSliderValueIndicatorShapeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RectangularRangeSliderValueIndicatorShape'),
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
            Text('The default shape of a RangeSlider\'s value indicators.'),
            const SizedBox(height: 16),
            const Text(
              'Documentation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SelectableText('https://api.flutter.dev/material/RectangularRangeSliderValueIndicatorShape-class.html'),
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
