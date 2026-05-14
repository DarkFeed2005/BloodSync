
-- Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('donor', 'hospital', 'admin', 'lab_tech')),
    contact VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Donors table
CREATE TABLE donors (
    donor_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    blood_type VARCHAR(5) NOT NULL,
    date_of_birth DATE,
    address TEXT,
    city VARCHAR(50),
    last_donation_date DATE,
    next_eligible_date DATE,
    total_donations INT DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Hospitals table
CREATE TABLE hospitals (
    hospital_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    hospital_name VARCHAR(200) NOT NULL,
    location TEXT,
    city VARCHAR(50),
    verification_status VARCHAR(20) DEFAULT 'pending',
    license_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Health Screening table
CREATE TABLE health_screenings (
    screening_id SERIAL PRIMARY KEY,
    donor_id INT REFERENCES donors(donor_id) ON DELETE CASCADE,
    screening_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    weight DECIMAL(5,2),
    has_fever BOOLEAN,
    has_cold BOOLEAN,
    on_medication BOOLEAN,
    recent_surgery BOOLEAN,
    alcohol_consumed BOOLEAN,
    eligibility_status VARCHAR(20),
    notes TEXT
);

-- Blood Requests table
CREATE TABLE blood_requests (
    request_id SERIAL PRIMARY KEY,
    hospital_id INT REFERENCES hospitals(hospital_id) ON DELETE CASCADE,
    blood_type_required VARCHAR(5) NOT NULL,
    units_required INT NOT NULL,
    urgency_level VARCHAR(20) NOT NULL CHECK (urgency_level IN ('critical', 'urgent', 'normal')),
    request_status VARCHAR(20) DEFAULT 'pending',
    required_by_date DATE,
    fulfilled_units INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Appointments table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    donor_id INT REFERENCES donors(donor_id) ON DELETE CASCADE,
    hospital_id INT REFERENCES hospitals(hospital_id) ON DELETE CASCADE,
    request_id INT REFERENCES blood_requests(request_id),
    appointment_date DATE NOT NULL,
    time_slot VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'completed', 'cancelled', 'no_show')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Blood Inventory table
CREATE TABLE blood_inventory (
    inventory_id SERIAL PRIMARY KEY,
    hospital_id INT REFERENCES hospitals(hospital_id) ON DELETE CASCADE,
    blood_type VARCHAR(5) NOT NULL,
    unit_count INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(hospital_id, blood_type)
);

-- Notifications table
CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    type VARCHAR(50),
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Donor Badges table
CREATE TABLE donor_badges (
    badge_id SERIAL PRIMARY KEY,
    donor_id INT REFERENCES donors(donor_id) ON DELETE CASCADE,
    badge_type VARCHAR(50) NOT NULL,
    earned_date DATE DEFAULT CURRENT_DATE,
    description TEXT
);
