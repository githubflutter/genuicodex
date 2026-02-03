class Component {
  const Component({
    required this.id,
    required this.name,
    required this.category,
    required this.summary,
    required this.docUrl,
    required this.kind,
  });

  final String id;
  final String name;
  final String category;
  final String summary;
  final String docUrl;
  final String kind;

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      docUrl: json['docUrl'] as String? ?? '',
      kind: json['kind'] as String? ?? '',
    );
  }
}

class ComponentCatalog {
  const ComponentCatalog({
    required this.schemaVersion,
    required this.generatedAt,
    required this.source,
    required this.components,
  });

  final String schemaVersion;
  final String generatedAt;
  final String source;
  final List<Component> components;

  factory ComponentCatalog.fromJson(Map<String, dynamic> json) {
    final components = (json['components'] as List<dynamic>? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(Component.fromJson)
        .toList();

    return ComponentCatalog(
      schemaVersion: json['schemaVersion'] as String? ?? '',
      generatedAt: json['generatedAt'] as String? ?? '',
      source: json['source'] as String? ?? '',
      components: components,
    );
  }
}
