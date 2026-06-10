@echo off
REM Build FloorPlanMeter.exe on Windows
REM Requires Python 3.9+ in PATH and Pillow + pyinstaller installed.

python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m pip install pyinstaller

pyinstaller --noconfirm --clean --onefile --windowed --name FloorPlanMeter floorplan_meter.py

echo.
echo Done.  EXE is at: dist\FloorPlanMeter.exe
pause
