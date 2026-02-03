import 'package:flutter/material.dart';

class MergeableMaterialExample extends StatelessWidget {
  const MergeableMaterialExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MergeableMaterial'),
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
            Text('Displays a list of MergeableMaterialItem children. The list contains MaterialSlice items whose boundaries are either "merged" with adjacent items or separated by a MaterialGap. The children are distributed along the given mainAxis in the same way as the children of a ListBody. When the list of children changes, gaps are automatically animated open or closed as needed.'),
            const SizedBox(height: 16),
            const Text(
              'Documentation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SelectableText('https://api.flutter.dev/material/MergeableMaterial-class.html'),
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
