# Docker Container Monitor

A comprehensive Docker container monitoring system with real-time dashboard, alerting, and reporting capabilities.

## Features

### 🐳 Container Monitoring
- Real-time container status monitoring
- CPU and memory usage tracking
- Container uptime/downtime logging
- Performance metrics collection

### 📊 Modern Dashboard
- React-based responsive dashboard
- Real-time WebSocket updates
- Interactive charts and metrics
- Dark theme with Material-UI

### 🔔 Alert System
- Configurable alert rules
- Email notifications
- Alert history and management
- Multiple severity levels

### 🔐 Authentication
- JWT-based authentication
- User registration and login
- Secure API endpoints
- Role-based access control

### 📈 Reporting
- Historical data analysis
- Performance trends
- Export capabilities
- Custom time ranges

## Architecture

- **Backend**: Python FastAPI with SQLAlchemy
- **Frontend**: React with Material-UI
- **Database**: SQLite (can be upgraded to PostgreSQL)
- **Real-time**: WebSocket connections
- **Authentication**: JWT tokens

## Quick Start

### Option 1: Docker (Recommended)

1. **Build the image:**
   ```bash
   docker build -t docker-monitor .
   ```

2. **Run the container:**
   ```bash
   docker run -d \
     --name docker-monitor \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -p 8000:8000 \
     docker-monitor
   ```

3. **Access the dashboard:**
   - Open http://localhost:8000
   - Register a new account or login
   - Start monitoring your containers

### Option 2: Development Setup

1. **Backend Setup:**
   ```bash
   cd app
   pip install -r requirements.txt
   uvicorn main:app --reload --host 0.0.0.0 --port 8000
   ```

2. **Frontend Setup:**
   ```bash
   cd dashboard/react-dashboard
   npm install
   npm start
   ```

3. **Access:**
   - Backend API: http://localhost:8000
   - Frontend: http://localhost:3000

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/verify` - Token verification

### Containers
- `GET /api/containers` - List all containers
- `GET /api/container_status` - Container status history
- `GET /api/container_metrics` - Container metrics

### Metrics
- `GET /api/metrics/latest` - Latest metrics for all containers
- `GET /api/containers/{id}/metrics` - Container-specific metrics

### Alerts
- `GET /api/alerts/recent` - Recent alerts
- `GET /api/alert_history` - Alert history
- `GET /api/alert_rules` - Alert rules
- `POST /api/alert_rules` - Create alert rule
- `PUT /api/alert_rules/{id}` - Update alert rule
- `DELETE /api/alert_rules/{id}` - Delete alert rule

### Settings
- `GET /api/settings/email` - Email notification settings
- `PUT /api/settings/email` - Update email settings
- `GET /api/settings/notifications` - Notification preferences
- `PUT /api/settings/notifications` - Update notification settings

## Configuration

### Environment Variables
- `JWT_SECRET` - Secret key for JWT tokens
- `DATABASE_URL` - Database connection string
- `SMTP_SERVER` - SMTP server for email notifications
- `SMTP_PORT` - SMTP port
- `SMTP_USERNAME` - SMTP username
- `SMTP_PASSWORD` - SMTP password

### Alert Rules
Configure custom alert rules in the Settings page:
- CPU usage thresholds
- Memory usage thresholds
- Container pattern matching
- Email notification settings

## Dashboard Features

### Main Dashboard
- Container status overview
- Real-time metrics display
- Quick actions for containers
- System health indicators

### Metrics Dashboard
- Historical performance data
- Interactive charts
- Resource usage trends
- Export capabilities

### Alert Center
- Active alerts display
- Alert filtering and search
- Alert acknowledgment
- Alert history

### Settings
- User preferences
- Email configuration
- Alert rule management
- System configuration

## Security

- JWT token authentication
- Password hashing with bcrypt
- CORS protection
- Input validation
- SQL injection prevention

## Monitoring

The system monitors:
- Container status (running, stopped, paused)
- CPU usage percentage
- Memory usage (MB and percentage)
- Container uptime/downtime
- Performance trends

## Troubleshooting

### Common Issues

1. **Docker socket access denied:**
   ```bash
   sudo chmod 666 /var/run/docker.sock
   ```

2. **Port already in use:**
   ```bash
   # Change port in docker run command
   docker run -p 8001:8000 docker-monitor
   ```

3. **Database errors:**
   ```bash
   # Check database file permissions
   ls -la app/monitor.db
   ```

### Logs
- Application logs: `logs/app.log`
- Authentication logs: `logs/auth.log`
- Email service logs: `logs/emailService.log`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.