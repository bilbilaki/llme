import os
from pathlib import Path

target_dir = Path("lib/config/llmmodels")
insert_line = "part of 'llmmodels.dart';\n"

for dart_file in target_dir.glob("*.dart"):
    with open(dart_file, 'r', encoding='utf-8') as f:
        content = f.readlines()

    if content and content[0].strip() == insert_line.strip():
        print(f"Already has part line: {dart_file}")
        continue

    with open(dart_file, 'w', encoding='utf-8') as f:
        f.write(insert_line)
        f.writelines(content)
        print(f"Updated: {dart_file}")
