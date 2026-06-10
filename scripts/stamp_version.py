"""
Stamp build metadata into floorplan_meter.py.

Run by the GitHub Actions workflow. Idempotent: replaces an existing
"# --- build metadata ---" block if present, otherwise appends.

Reads:
    GITHUB_REF_NAME   e.g. "main", "v2.0.0"
    GITHUB_SHA        commit SHA
Writes into floorplan_meter.py in the current working directory.
"""
import datetime
import os
import pathlib
import re

TARGET = pathlib.Path("floorplan_meter.py")
MARKER_START = "# --- build metadata ---"
BLOCK_RE = re.compile(
    r"# --- build metadata ---.*?__built_at__ = \"[^\"]*\"\n",
    re.S,
)


def main() -> int:
    ref = os.environ.get("GITHUB_REF_NAME", "local")
    sha = os.environ.get("GITHUB_SHA", "local")
    stamp = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%SZ")

    src = TARGET.read_text(encoding="utf-8")
    new_block = (
        f"{MARKER_START}\n"
        f'__version__ = "{ref}"\n'
        f'__build__ = "{sha}"\n'
        f'__built_at__ = "{stamp}"\n'
    )

    if BLOCK_RE.search(src):
        src = BLOCK_RE.sub(new_block, src, count=1)
    else:
        src = src.rstrip() + "\n\n" + new_block

    TARGET.write_text(src, encoding="utf-8")
    print(f"stamped: ref={ref} sha={sha[:10]}... built_at={stamp}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
