#!/bin/bash

echo "🚀 Starting Docker Container Monitor..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

# Build the Docker image
echo "📦 Building Docker image..."
docker build -t docker-monitor .

if [ $? -ne 0 ]; then
    echo "❌ Failed to build Docker image"
    exit 1
fi

# Stop existing container if running
echo "🛑 Stopping existing container..."
docker stop docker-monitor 2>/dev/null || true
docker rm docker-monitor 2>/dev/null || true

# Run the container
echo "▶️  Starting container..."
docker run -d \
  --name docker-monitor \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 8000:8000 \
  docker-monitor

if [ $? -eq 0 ]; then
    echo "✅ Docker Container Monitor is running!"
    echo "🌐 Access the dashboard at: http://localhost:3000"
    echo "📊 API documentation at: http://localhost:8000/docs"
    echo ""
    echo "To view logs: docker logs -f docker-monitor"
    echo "To stop: docker stop docker-monitor"
else
    echo "❌ Failed to start container"
    exit 1
fi
