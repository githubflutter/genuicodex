import json
import os
import re
import urllib.request
from html import unescape

SOURCE_URL = "https://api.flutter.dev/flutter/material/"
OUTPUT_PATH = "/Users/Shared/dev/git/genuicodex/assets/material_components.json"


def main() -> None:
    os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)
    html = urllib.request.urlopen(SOURCE_URL).read().decode("utf-8", errors="ignore")

    start = html.find('id="classes"')
    if start == -1:
        raise SystemExit("Classes section not found")

    fragment = html[start:]
    end = fragment.find('id="enums"')
    if end != -1:
        fragment = fragment[:end]

    items = re.findall(
        r'<dt[^>]*>\s*.*?<a[^>]+href="([^"]+)"[^>]*>([^<]+)</a>.*?</dt>\s*<dd>\s*(.*?)\s*</dd>',
        fragment,
        flags=re.S,
    )

    components = []
    for href, name, desc in items:
        if "material/" not in href:
            continue
        desc = re.sub(r"<[^>]+>", "", desc)
        desc = unescape(" ".join(desc.split()))
        doc_url = href if href.startswith("http") else f"https://api.flutter.dev/{href}"
        comp_id = re.sub(r"[^a-z0-9]+", "-", name.lower()).strip("-")
        components.append(
            {
                "id": comp_id,
                "name": name,
                "category": name[0].upper(),
                "summary": desc,
                "docUrl": doc_url,
                "kind": "class",
            }
        )

    catalog = {
        "schemaVersion": "1.0.0",
        "generatedAt": "2026-02-03",
        "source": SOURCE_URL,
        "components": components,
    }

    with open(OUTPUT_PATH, "w", encoding="utf-8") as handle:
        json.dump(catalog, handle, ensure_ascii=False, indent=2)

    print(f"Wrote {len(components)} components to {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
