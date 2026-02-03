import 'package:flutter/material.dart';

import '../models/component.dart';

class ComponentTile extends StatelessWidget {
  const ComponentTile({
    super.key,
    required this.component,
    required this.onTap,
  });

  final Component component;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(component.name),
      subtitle: Text(
        component.summary,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
