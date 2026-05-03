@echo off
cd /d "C:\Users\Hp\OneDrive\Desktop\zincirikirma"

git add .

set /p msg="Commit mesaji: "

git commit -m "%msg%"

git push origin main

echo.
echo Push tamamlandi! Vercel deploy ediliyor...
echo https://zincirikirma.org
echo.
pause
