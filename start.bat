@echo off
echo Starting Docker Container Management System...

REM Check if Docker is running
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Docker is not running. Please start Docker Desktop first.
    pause
    exit /b 1
)

echo Stopping and removing existing containers...
docker stop container-monitor 2>nul
docker rm container-monitor 2>nul

echo Building Docker image...
docker build -t container-monitor .

if %errorlevel% neq 0 (
    echo Error: Docker build failed.
    pause
    exit /b 1
)

echo Starting container...
docker run -d --name container-monitor -p 8000:8000 container-monitor

if %errorlevel% neq 0 (
    echo Error: Failed to start container.
    pause
    exit /b 1
)

echo.
echo ========================================
echo 🚀 Container Monitor is now running!
echo ========================================
echo.
echo 🌐 Access the dashboard at: http://localhost:8000
echo 📊 API documentation at: http://localhost:8000/docs
echo.
echo To stop the container: docker stop container-monitor
echo To view logs: docker logs container-monitor
echo.
pause
