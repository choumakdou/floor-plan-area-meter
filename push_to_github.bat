@echo off
REM ============================================================
REM Push Floor Plan Area Meter to GitHub
REM
REM You will need:
REM   1. A GitHub account
REM   2. An EMPTY repo created at github.com (e.g. floor-plan-area-meter)
REM   3. Git installed locally (https://git-scm.com/download/win)
REM
REM This script will prompt you for your GitHub username and the
REM remote URL, then commit and push.  No tokens are stored.
REM ============================================================

setlocal

if not exist ".git" (
    echo [1/5] Initialising local git repo...
    git init
    git branch -M main
) else (
    echo [1/5] Git repo already initialised.
)

echo [2/5] Adding files...
git add .

echo [3/5] Committing...
git commit -m "Initial commit: Floor Plan Area Meter" || (
    echo Nothing to commit, continuing.
)

echo.
set /p REMOTE_URL=Enter the GitHub repo URL (e.g. https://github.com/USER/floor-plan-area-meter.git)^: 

git remote remove origin 2>nul
git remote add origin %REMOTE_URL%

echo [4/5] Pushing to origin/main...
git push -u origin main

echo.
echo [5/5] Done!  Your repo should now be live at:
echo         %REMOTE_URL%
echo.
pause
endlocal
