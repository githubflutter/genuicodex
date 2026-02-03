import 'package:flutter/material.dart';

import '../models/component.dart';
import '../services/component_registry.dart';
import '../widgets/component_tile.dart';
import 'component_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late final Future<ComponentCatalog> _catalogFuture;
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _catalogFuture = ComponentRegistry.loadCatalog();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_query == _searchController.text) {
      return;
    }
    setState(() {
      _query = _searchController.text;
    });
  }

  void _openDetails(Component component) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ComponentDetailScreen(component: component),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genuicodex Catalog'),
      ),
      body: FutureBuilder<ComponentCatalog>(
        future: _catalogFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load catalog: ${snapshot.error}'),
            );
          }

          final catalog = snapshot.data;
          if (catalog == null || catalog.components.isEmpty) {
            return const Center(child: Text('No components found.'));
          }

          final filtered = ComponentRegistry.filterComponents(
            catalog.components,
            _query,
          );
          final grouped = ComponentRegistry.groupByCategory(filtered);

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Components: ${filtered.length}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search components',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _searchController.clear(),
                        ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              if (grouped.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Center(child: Text('No matches.')),
                )
              else
                ...grouped.entries.map(
                  (entry) => ExpansionTile(
                    title: Text('${entry.key} (${entry.value.length})'),
                    children: entry.value
                        .map(
                          (component) => ComponentTile(
                            component: component,
                            onTap: () => _openDetails(component),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
