CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    profile_image_url VARCHAR(500),
    bio TEXT,
    location VARCHAR(255),
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    is_verified BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    total_cruises_taken INTEGER DEFAULT 0,
    reviewer_level VARCHAR(20) DEFAULT 'Bronze' -- Bronze, Silver, Gold, Platinum
);

-- Cruise lines (operators)
CREATE TABLE cruise_lines (
    cruise_line_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(10) UNIQUE,
    description TEXT,
    logo_url VARCHAR(500),
    website_url VARCHAR(500),
    founded_year INTEGER,
    headquarters VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ships
CREATE TABLE ships (
    ship_id SERIAL PRIMARY KEY,
    cruise_line_id INTEGER REFERENCES cruise_lines(cruise_line_id),
    name VARCHAR(255) NOT NULL,
    ship_class VARCHAR(100),
    year_built INTEGER,
    passenger_capacity INTEGER,
    crew_size INTEGER,
    gross_tonnage DECIMAL(10,2),
    length_meters DECIMAL(8,2),
    width_meters DECIMAL(8,2),
    number_of_decks INTEGER,
    description TEXT,
    ship_image_url VARCHAR(500),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Destinations and ports
CREATE TABLE destinations (
    destination_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    region VARCHAR(100), -- Caribbean, Mediterranean, Alaska, etc.
    city VARCHAR(100),
    port_name VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    description TEXT,
    image_url VARCHAR(500),
    is_port_of_call BOOLEAN DEFAULT TRUE,
    is_departure_port BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- CRUISE PRODUCT TABLES
-- =====================================================

-- Main cruises table
CREATE TABLE cruises (
    cruise_id SERIAL PRIMARY KEY,
    cruise_line_id INTEGER REFERENCES cruise_lines(cruise_line_id),
    ship_id INTEGER REFERENCES ships(ship_id),
    cruise_name VARCHAR(255) NOT NULL,
    departure_port_id INTEGER REFERENCES destinations(destination_id),
    departure_date DATE NOT NULL,
    return_date DATE NOT NULL,
    duration_nights INTEGER NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD',
    max_passengers INTEGER,
    available_cabins INTEGER,
    cruise_type VARCHAR(50), -- Expedition, Luxury, Family, etc.
    itinerary_description TEXT,
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cruise itinerary (ports of call)
CREATE TABLE cruise_itinerary (
    itinerary_id SERIAL PRIMARY KEY,
    cruise_id INTEGER REFERENCES cruises(cruise_id),
    destination_id INTEGER REFERENCES destinations(destination_id),
    day_number INTEGER NOT NULL,
    arrival_time TIME,
    departure_time TIME,
    is_sea_day BOOLEAN DEFAULT FALSE,
    port_activities TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cabin types and pricing
CREATE TABLE cabin_types (
    cabin_type_id SERIAL PRIMARY KEY,
    ship_id INTEGER REFERENCES ships(ship_id),
    category_code VARCHAR(10) NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    max_occupancy INTEGER,
    size_sqft INTEGER,
    has_balcony BOOLEAN DEFAULT FALSE,
    has_ocean_view BOOLEAN DEFAULT FALSE,
    deck_location VARCHAR(50),
    amenities TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cruise pricing by cabin type
CREATE TABLE cruise_pricing (
    pricing_id SERIAL PRIMARY KEY,
    cruise_id INTEGER REFERENCES cruises(cruise_id),
    cabin_type_id INTEGER REFERENCES cabin_types(cabin_type_id),
    base_price DECIMAL(10,2) NOT NULL,
    current_price DECIMAL(10,2) NOT NULL,
    available_cabins INTEGER DEFAULT 0,
    is_sold_out BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- DEALS AND PROMOTIONS
-- =====================================================

CREATE TABLE deals (
    deal_id SERIAL PRIMARY KEY,
    cruise_id INTEGER REFERENCES cruises(cruise_id),
    deal_title VARCHAR(255) NOT NULL,
    deal_description TEXT,
    discount_type VARCHAR(20), -- percentage, fixed_amount, upgrade
    discount_value DECIMAL(10,2),
    original_price DECIMAL(10,2),
    deal_price DECIMAL(10,2),
    valid_from DATE,
    valid_until DATE,
    max_bookings INTEGER,
    current_bookings INTEGER DEFAULT 0,
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- REVIEWS AND RATINGS
-- =====================================================

-- Ship reviews
CREATE TABLE ship_reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    ship_id INTEGER REFERENCES ships(ship_id),
    cruise_id INTEGER REFERENCES cruises(cruise_id),
    overall_rating DECIMAL(2,1) CHECK (overall_rating >= 1 AND overall_rating <= 5),
    cabin_rating DECIMAL(2,1) CHECK (cabin_rating >= 1 AND cabin_rating <= 5),
    food_rating DECIMAL(2,1) CHECK (food_rating >= 1 AND food_rating <= 5),
    service_rating DECIMAL(2,1) CHECK (service_rating >= 1 AND service_rating <= 5),
    entertainment_rating DECIMAL(2,1) CHECK (entertainment_rating >= 1 AND entertainment_rating <= 5),
    value_rating DECIMAL(2,1) CHECK (value_rating >= 1 AND value_rating <= 5),
    review_title VARCHAR(255),
    review_text TEXT,
    cruise_date DATE,
    cabin_type VARCHAR(100),
    traveler_type VARCHAR(50), -- Solo, Couple, Family, Friends
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    helpful_votes INTEGER DEFAULT 0,
    is_verified_cruise BOOLEAN DEFAULT FALSE,
    is_featured BOOLEAN DEFAULT FALSE
);

-- Review helpfulness votes
CREATE TABLE review_votes (
    vote_id SERIAL PRIMARY KEY,
    review_id INTEGER REFERENCES ship_reviews(review_id),
    user_id INTEGER REFERENCES users(user_id),
    is_helpful BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(review_id, user_id)
);

-- =====================================================
-- BOOKINGS AND TRANSACTIONS
-- =====================================================

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    cruise_id INTEGER REFERENCES cruises(cruise_id),
    cabin_type_id INTEGER REFERENCES cabin_types(cabin_type_id),
    booking_reference VARCHAR(50) UNIQUE NOT NULL,
    number_of_passengers INTEGER NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'confirmed', -- pending, confirmed, cancelled, completed
    payment_status VARCHAR(20) DEFAULT 'pending', -- pending, paid, refunded
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    special_requests TEXT,
    emergency_contact_name VARCHAR(255),
    emergency_contact_phone VARCHAR(20)
);

-- Booking passengers
CREATE TABLE booking_passengers (
    passenger_id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES bookings(booking_id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    passport_number VARCHAR(50),
    nationality VARCHAR(100),
    dietary_requirements TEXT,
    mobility_requirements TEXT,
    is_primary_contact BOOLEAN DEFAULT FALSE
);

-- =====================================================
-- CONTENT AND COMMUNITY
-- =====================================================

-- Articles and guides
CREATE TABLE articles (
    article_id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES users(user_id),
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE,
    content TEXT NOT NULL,
    excerpt TEXT,
    featured_image_url VARCHAR(500),
    category VARCHAR(100), -- Tips, Guides, News, Ship Reviews
    tags TEXT, -- JSON array of tags
    view_count INTEGER DEFAULT 0,
    is_published BOOLEAN DEFAULT FALSE,
    is_featured BOOLEAN DEFAULT FALSE,
    published_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Community forum categories
CREATE TABLE forum_categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE
);

-- Community forum topics
CREATE TABLE forum_topics (
    topic_id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES forum_categories(category_id),
    user_id INTEGER REFERENCES users(user_id),
    title VARCHAR(255) NOT NULL,
    is_pinned BOOLEAN DEFAULT FALSE,
    is_locked BOOLEAN DEFAULT FALSE,
    view_count INTEGER DEFAULT 0,
    reply_count INTEGER DEFAULT 0,
    last_reply_at TIMESTAMP,
    last_reply_user_id INTEGER REFERENCES users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Community forum posts
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    topic_id INTEGER REFERENCES forum_topics(topic_id),
    user_id INTEGER REFERENCES users(user_id),
    content TEXT NOT NULL,
    is_solution BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- SEARCH AND FILTERING SUPPORT
-- =====================================================

-- Popular search terms tracking
CREATE TABLE search_logs (
    search_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    search_term VARCHAR(255),
    filters_applied TEXT, -- JSON string of applied filters
    results_count INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- Cruise search indexes
CREATE INDEX idx_cruises_departure_date ON cruises(departure_date);
CREATE INDEX idx_cruises_departure_port ON cruises(departure_port_id);
CREATE INDEX idx_cruises_duration ON cruises(duration_nights);
CREATE INDEX idx_cruises_price ON cruises(base_price);
CREATE INDEX idx_cruises_ship ON cruises(ship_id);
CREATE INDEX idx_cruises_active ON cruises(is_active);

-- Review indexes
CREATE INDEX idx_ship_reviews_ship ON ship_reviews(ship_id);
CREATE INDEX idx_ship_reviews_rating ON ship_reviews(overall_rating);
CREATE INDEX idx_ship_reviews_date ON ship_reviews(review_date);

-- Destination indexes
CREATE INDEX idx_destinations_region ON destinations(region);
CREATE INDEX idx_destinations_country ON destinations(country);

-- Booking indexes
CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_bookings_cruise ON bookings(cruise_id);
CREATE INDEX idx_bookings_date ON bookings(booking_date);
CREATE INDEX idx_bookings_status ON bookings(booking_status);

-- Forum indexes
CREATE INDEX idx_forum_topics_category ON forum_topics(category_id);
CREATE INDEX idx_forum_topics_created ON forum_topics(created_at);
CREATE INDEX idx_forum_posts_topic ON forum_posts(topic_id);
CREATE INDEX idx_forum_posts_user ON forum_posts(user_id);

-- Search indexes
CREATE INDEX idx_search_logs_term ON search_logs(search_term);
CREATE INDEX idx_search_logs_created ON search_logs(created_at); 