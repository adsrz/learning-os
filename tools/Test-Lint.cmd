@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Test-Lint.ps1" %*
