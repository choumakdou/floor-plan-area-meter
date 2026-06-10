# PyInstaller spec for Floor Plan Area Meter
# Build with:
#     pyinstaller --noconfirm --clean floorplan_meter.spec
# Or the one-liner:
#     pyinstaller --noconfirm --onefile --windowed --name FloorPlanMeter floorplan_meter.py

# -*- mode: python ; coding: utf-8 -*-
block_cipher = None

a = Analysis(
    ['floorplan_meter.py'],
    pathex=[],
    binaries=[],
    datas=[],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='FloorPlanMeter',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,        # set True to see a console for debugging
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,            # drop a .ico path here to brand the exe
)
