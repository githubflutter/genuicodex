# Genuicodex

A Flutter Material catalog app driven by a JSON component registry. The goal is to showcase every Material UI component listed in https://api.flutter.dev/flutter/material/material-library.html.

## Features
- JSON-driven catalog (assets/material_components.json)
- Searchable, category-grouped UI
- Detail view with documentation links
- JSON Schema for the catalog format (schema/material_components.schema.json)

## Getting started
This repository contains the app sources. Generate platform folders (excluding Web) before running:

```bash
flutter create . --platforms=android,ios,macos,windows,linux
flutter pub get
flutter run
```

## Repository layout
- lib/: application source
- assets/: component catalog JSON
- schema/: JSON Schema for the catalog

## Regenerating the catalog
The catalog JSON is derived from the Flutter Material library docs. To rebuild:

1) Run tools/generate_catalog.py
2) The output is written to assets/material_components.json

## Licensing
This repository is dual-licensed under MIT and Apache-2.0. See LICENSE-MIT and LICENSE-APACHE.