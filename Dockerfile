FROM python:3.11-slim
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Copy Python backend
COPY ./app ./app
COPY ./app/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy React frontend
COPY ./dashboard/react-dashboard ./dashboard/react-dashboard
WORKDIR /app/dashboard/react-dashboard
RUN npm install
RUN npm run build

# Return to app directory
WORKDIR /app

# Copy static files to serve
RUN cp -r dashboard/react-dashboard/build/* app/static/

# Expose port
EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]