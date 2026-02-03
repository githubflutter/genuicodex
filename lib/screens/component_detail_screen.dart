import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/component.dart';

class ComponentDetailScreen extends StatelessWidget {
  const ComponentDetailScreen({
    super.key,
    required this.component,
  });

  final Component component;

  Future<void> _copyLink(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: component.docUrl));
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Documentation link copied.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(component.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            component.summary,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text(component.category)),
              Chip(label: Text(component.kind)),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Documentation',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          SelectableText(component.docUrl),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: () => _copyLink(context),
              icon: const Icon(Icons.link),
              label: const Text('Copy link'),
            ),
          ),
        ],
      ),
    );
  }
}
