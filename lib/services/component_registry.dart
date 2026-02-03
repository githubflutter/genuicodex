import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/component.dart';

class ComponentRegistry {
  ComponentRegistry._();

  static const String _assetPath = 'assets/material_components.json';

  static Future<ComponentCatalog> loadCatalog() async {
    final jsonString = await rootBundle
        .loadString(_assetPath)
        .timeout(const Duration(seconds: 8));
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return ComponentCatalog.fromJson(jsonMap);
  }

  static List<Component> filterComponents(
    List<Component> components,
    String query,
  ) {
    if (query.trim().isEmpty) {
      return components;
    }

    final normalized = query.toLowerCase();
    return components.where((component) {
      return component.name.toLowerCase().contains(normalized) ||
          component.summary.toLowerCase().contains(normalized) ||
          component.category.toLowerCase().contains(normalized);
    }).toList();
  }

  static Map<String, List<Component>> groupByCategory(
    List<Component> components,
  ) {
    final Map<String, List<Component>> grouped = {};
    for (final component in components) {
      grouped.putIfAbsent(component.category, () => []).add(component);
    }

    for (final entry in grouped.entries) {
      entry.value.sort((a, b) => a.name.compareTo(b.name));
    }

    final sortedKeys = grouped.keys.toList()..sort();
    return {
      for (final key in sortedKeys) key: grouped[key]!,
    };
  }
}
