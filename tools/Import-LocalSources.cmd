@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Import-LocalSources.ps1" %*
