-- ============================================
-- RR Motors Bike Showroom Database Schema
-- Database: PostgreSQL (Supabase)
-- Simplified schema with 3 main tables:
-- 1. brands - Master brand list
-- 2. bikes - New bikes inventory
-- 3. second_hand_bikes - Pre-owned/used bikes
-- ============================================

-- ============================================
-- BRANDS TABLE - Master list of brands
-- ============================================
CREATE TABLE brands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  logo_url TEXT,
  country VARCHAR(100),
  founded_year INTEGER,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- BIKES TABLE - New bikes inventory
-- ============================================
CREATE TABLE bikes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  brand_id INTEGER NOT NULL REFERENCES brands(id) ON DELETE RESTRICT,
  price VARCHAR(50) NOT NULL,
  original_price VARCHAR(50),
  category VARCHAR(50) NOT NULL CHECK (category IN ('Sports', 'Scooter', 'Commuter', 'Cruiser', 'Adventure', 'Naked')),
  specs VARCHAR(255) NOT NULL,
  engine_cc INTEGER,
  horsepower VARCHAR(50),
  torque VARCHAR(50),
  transmission VARCHAR(50),
  
  -- Image and media
  image_url TEXT,
  additional_images TEXT[],
  
  -- Detailed information
  description TEXT,
  features TEXT[],
  warranty VARCHAR(100),
  color VARCHAR(100),
  
  -- Availability and status
  availability BOOLEAN DEFAULT TRUE,
  stock_quantity INTEGER DEFAULT 0,
  year_model INTEGER,
  
  -- Timestamps
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  UNIQUE(name, brand_id)
);

-- ============================================
-- SECOND_HAND_BIKES TABLE - Pre-owned/used bikes
-- ============================================
CREATE TABLE second_hand_bikes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  brand_id INTEGER NOT NULL REFERENCES brands(id) ON DELETE RESTRICT,
  price VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL CHECK (category IN ('Sports', 'Scooter', 'Commuter', 'Cruiser', 'Adventure', 'Naked')),
  specs VARCHAR(255) NOT NULL,
  engine_cc INTEGER,
  horsepower VARCHAR(50),
  
  -- Pre-owned specific details
  condition VARCHAR(50) NOT NULL CHECK (condition IN ('Excellent', 'Very Good', 'Good', 'Fair')),
  mileage VARCHAR(50),
  year_manufacture INTEGER,
  owner_count INTEGER,
  registration_number VARCHAR(50) NOT NULL,
  
  -- Image and media
  image_url TEXT,
  additional_images TEXT[],
  
  -- Detailed information
  description TEXT,
  features TEXT[],
  color VARCHAR(100),
  
  -- Availability and status
  availability BOOLEAN DEFAULT TRUE,
  
  -- Timestamps
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- CREATE INDEXES for faster queries
-- ============================================
CREATE INDEX idx_bikes_brand_id ON bikes(brand_id);
CREATE INDEX idx_bikes_category ON bikes(category);
CREATE INDEX idx_bikes_name ON bikes(name);
CREATE INDEX idx_bikes_availability ON bikes(availability);

CREATE INDEX idx_second_hand_brand_id ON second_hand_bikes(brand_id);
CREATE INDEX idx_second_hand_category ON second_hand_bikes(category);
CREATE INDEX idx_second_hand_name ON second_hand_bikes(name);
CREATE INDEX idx_second_hand_availability ON second_hand_bikes(availability);

-- ============================================
-- SAMPLE DATA - Initial setup
-- ============================================

-- Insert sample brands
INSERT INTO brands (name, description, country, founded_year)
VALUES
  ('Velocity', 'High-performance sports bikes', 'Japan', 2010),
  ('Thunder', 'Classic and modern cruisers', 'USA', 2005),
  ('Urban', 'City commuter scooters', 'India', 2015),
  ('Trail Master', 'Adventure and off-road bikes', 'Germany', 2008),
  ('Street Fighter', 'Aggressive naked bikes', 'Italy', 2012);

-- Insert sample new bikes
INSERT INTO bikes (name, brand_id, price, category, specs, engine_cc, horsepower, description, features, availability, stock_quantity, year_model)
VALUES
  (
    'Velocity R1000',
    (SELECT id FROM brands WHERE name = 'Velocity'),
    '₹12,50,000',
    'Sports',
    '1000cc | 180 HP',
    1000,
    '180',
    'High-performance sports bike with cutting-edge technology. Perfect for speed enthusiasts.',
    ARRAY['ABS System', 'Traction Control', 'Cruise Control', 'LED Lighting', 'Digital Dash', 'Keyless Start'],
    TRUE,
    5,
    2024
  ),
  (
    'Thunder Cruiser 650',
    (SELECT id FROM brands WHERE name = 'Thunder'),
    '₹8,75,000',
    'Cruiser',
    '650cc | 75 HP',
    650,
    '75',
    'Classic cruiser design with modern comfort. Ideal for long rides.',
    ARRAY['Classic Styling', 'Comfortable Seating', 'Premium Comfort', 'Retro Look'],
    TRUE,
    3,
    2024
  ),
  (
    'Urban Glide 125',
    (SELECT id FROM brands WHERE name = 'Urban'),
    '₹95,000',
    'Scooter',
    '125cc | 9 HP',
    125,
    '9',
    'Automatic city commuter scooter. Perfect for daily urban commuting.',
    ARRAY['Automatic Transmission', 'Storage Space', 'Fuel Efficient', 'Easy Parking'],
    TRUE,
    10,
    2024
  ),
  (
    'Trail Master Adventure 500',
    (SELECT id FROM brands WHERE name = 'Trail Master'),
    '₹7,25,000',
    'Adventure',
    '500cc | 60 HP',
    500,
    '60',
    'Adventure bike for off-road and highway exploration.',
    ARRAY['Off-road Capability', 'Long Travel Suspension', 'Versatile Design'],
    TRUE,
    4,
    2024
  ),
  (
    'Street Fighter Z 800',
    (SELECT id FROM brands WHERE name = 'Street Fighter'),
    '₹9,25,000',
    'Naked',
    '800cc | 110 HP',
    800,
    '110',
    'Aggressive naked bike with raw performance.',
    ARRAY['Aggressive Styling', 'High Performance', 'Lightweight Frame', 'Quick Handling'],
    TRUE,
    2,
    2024
  );

-- Insert sample second-hand bikes
INSERT INTO second_hand_bikes (name, brand_id, price, category, specs, engine_cc, horsepower, condition, mileage, year_manufacture, owner_count, description, features, availability)
VALUES
  (
    'Thunder Cruiser 650 - Used',
    (SELECT id FROM brands WHERE name = 'Thunder'),
    '₹6,50,000',
    'Cruiser',
    '650cc | 75 HP',
    650,
    '75',
    'Excellent',
    '5000 km',
    2023,
    1,
    'Well-maintained second-hand cruiser with minimal usage.',
    ARRAY['Classic Styling', 'Comfortable Seating', 'Well Maintained'],
    TRUE
  ),
  (
    'Urban Glide 125 - Used',
    (SELECT id FROM brands WHERE name = 'Urban'),
    '₹65,000',
    'Scooter',
    '125cc | 9 HP',
    125,
    '9',
    'Very Good',
    '15000 km',
    2022,
    2,
    'Reliable commuter scooter, perfect for daily use.',
    ARRAY['Automatic Transmission', 'Storage Space', 'Fuel Efficient'],
    TRUE
  );

-- ============================================
-- API QUERIES REFERENCE
-- ============================================
/*

-- Get all new bikes with brand info
SELECT b.*, br.name as brand_name 
FROM bikes b 
JOIN brands br ON b.brand_id = br.id 
WHERE b.availability = TRUE 
ORDER BY br.name;

-- Get bikes by brand
SELECT b.*, br.name as brand_name 
FROM bikes b 
JOIN brands br ON b.brand_id = br.id 
WHERE br.name = 'Velocity' AND b.availability = TRUE;

-- Get bikes by category
SELECT b.*, br.name as brand_name 
FROM bikes b 
JOIN brands br ON b.brand_id = br.id 
WHERE b.category = 'Sports' AND b.availability = TRUE;

-- Get all second-hand bikes with brand info
SELECT sb.*, br.name as brand_name 
FROM second_hand_bikes sb 
JOIN brands br ON sb.brand_id = br.id 
WHERE sb.availability = TRUE 
ORDER BY br.name;

-- Get second-hand bikes by brand
SELECT sb.*, br.name as brand_name 
FROM second_hand_bikes sb 
JOIN brands br ON sb.brand_id = br.id 
WHERE br.name = 'Thunder' AND sb.availability = TRUE;

-- Get second-hand bikes by condition
SELECT sb.*, br.name as brand_name 
FROM second_hand_bikes sb 
JOIN brands br ON sb.brand_id = br.id 
WHERE sb.condition = 'Excellent' AND sb.availability = TRUE;

-- Create new bike (with brand check)
WITH brand_check AS (
  SELECT id FROM brands WHERE name = 'Brand Name' LIMIT 1
)
INSERT INTO bikes (name, brand_id, price, category, specs, engine_cc, horsepower, description, features, availability, stock_quantity, year_model)
SELECT 'New Bike', id, '₹Price', 'Category', 'Specs', 500, '50', 'Description', ARRAY['Feature1', 'Feature2'], TRUE, 5, 2024
FROM brand_check;

-- Create new second-hand bike (with brand check)
WITH brand_check AS (
  SELECT id FROM brands WHERE name = 'Brand Name' LIMIT 1
)
INSERT INTO second_hand_bikes (name, brand_id, price, category, specs, engine_cc, horsepower, condition, mileage, year_manufacture, owner_count, description, features, availability)
SELECT 'Used Bike', id, '₹Price', 'Category', 'Specs', 500, '50', 'Excellent', '5000 km', 2023, 1, 'Description', ARRAY['Feature1'], TRUE
FROM brand_check;

-- Update bike availability
UPDATE bikes SET availability = FALSE WHERE id = 1;

-- Update second-hand bike availability
UPDATE second_hand_bikes SET availability = FALSE WHERE id = 1;

-- Delete bike
DELETE FROM bikes WHERE id = 1;

-- Delete second-hand bike
DELETE FROM second_hand_bikes WHERE id = 1;

*/
