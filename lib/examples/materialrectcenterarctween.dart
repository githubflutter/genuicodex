import 'package:flutter/material.dart';

class MaterialRectCenterArcTweenExample extends StatelessWidget {
  const MaterialRectCenterArcTweenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialRectCenterArcTween'),
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
            Text('A Tween that interpolates a Rect by moving it along a circular arc from begin\'s Rect.center to end\'s Rect.center while interpolating the rectangle\'s width and height.'),
            const SizedBox(height: 16),
            const Text(
              'Documentation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SelectableText('https://api.flutter.dev/material/MaterialRectCenterArcTween-class.html'),
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
