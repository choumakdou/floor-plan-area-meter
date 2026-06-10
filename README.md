# Floor Plan Area Meter

A small Python desktop app for measuring room areas on a floor plan image.

![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)
![Build](https://img.shields.io/github/actions/workflow/status/USER/REPO/build.yml?label=build)

## Features

- Open any floor plan image (PNG / JPG / BMP / GIF / TIFF).
- Calibrate with two **vertical** reference points + two **horizontal** reference
  points and a real-world distance for each (in metres or feet).
- Click to place polygon vertices, right-click (or press **Enter**) to close.
- Each polygon gets a random colour at **50 % alpha** so rooms stack visibly.
- Live area labels, toggleable between **px² · m² · ft²**.
- Zoom (mouse-wheel), pan (middle-drag or hold Space + drag), Fit, 100 %.
- Save / load projects (`.fpm.json`) including image path, calibration and
  all polygons.

## Run from source

```bash
pip install -r requirements.txt
python floorplan_meter.py
```

`tkinter` ships with the standard CPython installer on Windows and macOS
(no separate install).  On Debian/Ubuntu you may need `sudo apt install python3-tk`.

## Build the .exe

### Option A — Locally on Windows

```bat
build_exe.bat
```

Or by hand:

```bat
pyinstaller --noconfirm --clean --onefile --windowed --name FloorPlanMeter floorplan_meter.py
```

The output is `dist\FloorPlanMeter.exe`.  A pre-baked PyInstaller spec is also
provided: `floorplan_meter.spec`.

### Option B — GitHub Actions (no local toolchain needed)

The repo ships with `.github/workflows/build.yml`.  It runs on **every push to
`main`** and produces a downloadable `FloorPlanMeter.exe` as a workflow
artifact.  Tag pushes (`v*`) additionally create a GitHub Release with the
.exe attached.

**Where to grab the .exe after pushing:**

1. Repo → **Actions** tab → pick the latest green run → scroll to
   **Artifacts** at the bottom → download `FloorPlanMeter-windows.zip`.
2. Or, if you pushed a tag like `v1.0.0`: **Releases** page has the .exe
   attached directly.

You can also trigger a one-off build from the **Actions** tab → **Run
workflow** → grab the artifact from the run summary page.

**Cut a release:**

```bat
git tag v1.0.0
git push origin v1.0.0
```

## Controls cheat-sheet

| Action | Input |
|---|---|
| Place polygon vertex / set calibration point | **Left-click** |
| Close current polygon | **Right-click** or **Enter** |
| Cancel current polygon | **Esc** |
| Undo last vertex | toolbar ▸ *Undo Point* |
| Zoom | mouse-wheel (Ctrl+wheel = fine) |
| Pan | middle-drag, or hold **Space** + drag |
| Toggle units | toolbar ▸ *Units* dropdown |

## Calibration 101

1. Pick **Calibrate V**, click two points on a known vertical edge of the plan
   (e.g. a wall whose real length you know), then type that length in the side
   panel ▸ *Set V*.
2. Repeat with **Calibrate H** for a horizontal reference.
3. Switch back to **Polygon** mode and trace rooms.
4. Flip the *Units* dropdown to switch between **px²**, **m²** and **ft²**
   live — all polygons recompute instantly.
