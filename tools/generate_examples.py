import json
import os
import re
from datetime import datetime

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
CATALOG_PATH = os.path.join(REPO_ROOT, "assets", "material_components.json")
OUTPUT_DIR = os.path.join(REPO_ROOT, "lib", "examples")


def _safe_identifier(name: str) -> str:
    cleaned = re.sub(r"[^a-zA-Z0-9_]", "", name)
    if not cleaned:
        return "Component"
    if cleaned[0].isdigit():
        return f"Component{cleaned}"
    return cleaned


def _to_file_name(component_id: str) -> str:
    return f"{component_id}.dart"


def _build_example_source(component: dict) -> str:
    name = component.get("name", "Component")
    summary = component.get("summary", "")
    doc_url = component.get("docUrl", "")
    class_name = f"{_safe_identifier(name)}Example"

    summary_escaped = summary.replace("'", "\\'")
    doc_url_escaped = doc_url.replace("'", "\\'")

    return f"""import 'package:flutter/material.dart';

class {class_name} extends StatelessWidget {{
  const {class_name}({{super.key}});

  @override
  Widget build(BuildContext context) {{
    return Scaffold(
      appBar: AppBar(
        title: const Text('{name}'),
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
            Text('{summary_escaped}'),
            const SizedBox(height: 16),
            const Text(
              'Documentation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SelectableText('{doc_url_escaped}'),
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
  }}
}}
"""


def main() -> None:
    if not os.path.exists(CATALOG_PATH):
        raise SystemExit(f"Catalog not found: {CATALOG_PATH}")

    with open(CATALOG_PATH, "r", encoding="utf-8") as handle:
        catalog = json.load(handle)

    components = catalog.get("components", [])
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    for component in components:
        component_id = component.get("id") or "component"
        file_path = os.path.join(OUTPUT_DIR, _to_file_name(component_id))
        source = _build_example_source(component)
        with open(file_path, "w", encoding="utf-8") as handle:
            handle.write(source)

    stamp_path = os.path.join(OUTPUT_DIR, "_generated_at.txt")
    with open(stamp_path, "w", encoding="utf-8") as handle:
        handle.write(datetime.utcnow().isoformat() + "Z\n")
        handle.write(f"Generated {len(components)} example files.\n")

    print(f"Generated {len(components)} examples in {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
