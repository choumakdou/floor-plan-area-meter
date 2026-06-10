@echo off
REM ============================================================
REM First-time setup: init the local repo, commit, and push to
REM GitHub.  After this, every push to `main` triggers the build
REM workflow and produces FloorPlanMeter.exe in the Actions tab.
REM
REM Prerequisites:
REM   - You have already created an EMPTY repo on github.com
REM     (e.g. https://github.com/USER/floor-plan-area-meter)
REM   - git is installed
REM   - You are authenticated with GitHub (gh auth login, or SSH key,
REM     or GitHub Desktop)
REM ============================================================

setlocal

if exist ".git" (
    echo A .git folder already exists here.  Skipping init.
) else (
    echo [1/6] Initialising local git repo...
    git init
    git branch -M main
)

echo [2/6] Ensuring main is the default branch...
git symbolic-ref HEAD refs/heads/main

echo [3/6] Adding files...
git add .

echo [4/6] Committing...
git commit -m "Initial commit: Floor Plan Area Meter with GitHub Actions build"

echo.
set /p REMOTE_URL=Enter the GitHub repo URL (e.g. https://github.com/USER/floor-plan-area-meter.git)^: 

git remote remove origin 2>nul
git remote add origin %REMOTE_URL%

echo [5/6] Pushing to origin/main...
git push -u origin main

echo.
echo [6/6] Done!
echo.
echo The build workflow has been triggered.  In ~2-3 minutes your
echo FloorPlanMeter.exe will be ready here:
echo.
echo    https://github.com/%REMOTE_URL:~19,-4%/actions
echo.
echo (Open the latest green run, scroll to Artifacts, download
echo  FloorPlanMeter-windows.zip.)
echo.
pause
endlocal
