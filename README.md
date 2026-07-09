# BloodSync
A Web-based Blood Donor Coordination and Management System 



## Technology Stack

### Frontend
- **React 18+** - UI framework
- **React Router DOM** - Routing
- **Tailwind CSS** - Styling
- **Axios** - HTTP client
- **React Hook Form** - Form management
- **React Toastify** - Notifications
- **Lucide React** - Icons

### Backend
- **PHP 8+** - Backend language
- **PostgreSQL** - Database
- **JWT** - Authentication
- **PDO** - Database connection

## Installation Steps

### 1. Frontend Setup

```bash
# Create React app
npx create-react-app bloodsync-frontend
cd bloodsync-frontend

# Install dependencies
npm install react-router-dom axios react-hook-form react-toastify lucide-react

# Install Tailwind CSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

### 2. Backend Setup

```bash
# Create backend directory
mkdir bloodsync-backend
cd bloodsync-backend

# Install Composer (if not already installed)
# Download from https://getcomposer.org/

# Create composer.json
composer init

# Install dependencies
composer require firebase/php-jwt
```

### 3. Database Setup

```bash
# Install PostgreSQL
# Create database
createdb bloodsync_db

# Run schema creation script
psql bloodsync_db < schema.sql
```

## Environment Configuration

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:8000/api
REACT_APP_API_TIMEOUT=10000
```

### Backend (.env or config)
```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=bloodsync_db
DB_USER=your_username
DB_PASS=your_password
JWT_SECRET=your_secret_key_here
```

## Key Features Implementation

### 1. Authentication System
- JWT-based authentication
- Role-based access control
- Secure password hashing (bcrypt)

### 2. Donor Management
- Profile creation and management
- Health pre-screening forms
- Automatic eligibility calculation (4-month rule)
- Donation history tracking

### 3. Hospital Features
- Blood request posting
- Priority queue system
- Live stock dashboard
- Donor matching algorithm

### 4. Admin Panel
- User management
- System monitoring
- Report generation
- Configuration settings

### 5. Appointment System
- Time slot booking
- Hospital confirmation
- Automated reminders

### 6. Notification System
- Real-time alerts
- Email notifications (optional)
- In-app notifications

## API Endpoints Structure

```
POST   /api/auth/register
POST   /api/auth/login
POST   /api/auth/logout

GET    /api/donor/profile
PUT    /api/donor/profile
POST   /api/donor/screening
GET    /api/donor/appointments
POST   /api/donor/appointments

GET    /api/hospital/requests
POST   /api/hospital/requests
PUT    /api/hospital/requests/:id
GET    /api/hospital/stock
PUT    /api/hospital/stock

GET    /api/admin/users
POST   /api/admin/users
PUT    /api/admin/users/:id
DELETE /api/admin/users/:id

GET    /api/notifications
PUT    /api/notifications/:id/read
```

## Security Considerations

1. **Input Validation**: Validate all inputs on both frontend and backend
2. **SQL Injection Prevention**: Use prepared statements with PDO
3. **XSS Prevention**: Sanitize outputs
4. **CSRF Protection**: Implement CSRF tokens
5. **Password Security**: Use bcrypt for hashing
6. **JWT Security**: Set appropriate expiration times
7. **CORS Configuration**: Restrict allowed origins

## Development Workflow

1. Set up the database schema
2. Create backend API endpoints
3. Test APIs using Postman/Insomnia
4. Build React components
5. Integrate frontend with backend
6. Implement authentication flow
7. Add role-based routing
8. Test all features
9. Deploy to production

## Deployment

### Frontend
- Build: `npm run build`
- Deploy to: Vercel, Netlify, or traditional hosting

### Backend
- Deploy to: Shared hosting with PHP support, VPS, or cloud platform
- Ensure PHP 8+ and PostgreSQL are available

## Testing Strategy

1. Unit tests for API endpoints
2. Integration tests for complete workflows
3. UI testing with React Testing Library
4. Manual testing for user flows

## Next Steps

1. Clone/create the project structure
2. Set up the database
3. Implement core API endpoints
4. Build authentication system
5. Create main dashboard components
6. Integrate matching algorithm
7. Add notification system
8. Test thoroughly
9. Deploy and monitor