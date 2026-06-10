@echo off
REM ============================================================
REM Tag a release on GitHub.  Triggers the GitHub Actions workflow
REM that builds FloorPlanMeter.exe and attaches it to a Release.
REM ============================================================

setlocal

if "%~1"=="" (
    echo Usage: release.bat v1.0.0
    echo   e.g. release.bat v0.1.0
    exit /b 1
)

set TAG=%~1

echo Tagging %TAG%...
git tag %TAG%
git push origin %TAG%

echo.
echo Done.  In ~2 minutes your .exe will be available at:
echo   https://github.com/USER/REPO/releases/tag/%TAG%
echo.
echo (Replace USER/REPO with your actual GitHub path.)
echo.
pause
endlocal
