INSERT INTO cruise_lines (name, code, description, founded_year, headquarters) VALUES
('Royal Caribbean International', 'RCI', 'The world''s largest cruise line offering innovative ships and exciting destinations', 1968, 'Miami, Florida'),
('Carnival Cruise Line', 'CCL', 'Fun ships offering affordable cruises with a focus on entertainment and dining', 1972, 'Miami, Florida'),
('Norwegian Cruise Line', 'NCL', 'Freestyle cruising with no formal dress codes and flexible dining', 1966, 'Miami, Florida'),
('Princess Cruises', 'PC', 'Premium cruise line known for excellent service and worldwide itineraries', 1965, 'Santa Clarita, California'),
('Celebrity Cruises', 'CX', 'Premium cruise line focusing on modern luxury and culinary excellence', 1988, 'Miami, Florida'),
('Holland America Line', 'HAL', 'Mid-premium cruise line with a focus on destination-rich cruising', 1873, 'Seattle, Washington'),
('Viking Ocean Cruises', 'VO', 'Adult-only ocean cruises focusing on cultural enrichment', 2015, 'Basel, Switzerland'),
('MSC Cruises', 'MSC', 'Mediterranean-style cruising with international flair', 1987, 'Geneva, Switzerland');

-- Insert sample ships
INSERT INTO ships (cruise_line_id, name, ship_class, year_built, passenger_capacity, crew_size, gross_tonnage, description) VALUES
(1, 'Symphony of the Seas', 'Oasis', 2018, 6680, 2200, 228081.00, 'World''s largest cruise ship with incredible amenities including surf simulators, rock climbing walls, and Broadway-style shows'),
(1, 'Wonder of the Seas', 'Oasis', 2022, 6988, 2300, 236857.00, 'The newest and largest ship in the world featuring multiple neighborhoods and innovative dining'),
(2, 'Carnival Celebration', 'Excel', 2022, 5374, 1735, 183900.00, 'Latest Carnival ship featuring the first roller coaster at sea and numerous entertainment venues'),
(3, 'Norwegian Breakaway', 'Breakaway', 2013, 3963, 1657, 146600.00, 'NYC-themed ship with Broadway shows and extensive dining options'),
(4, 'Crown Princess', 'Crown', 2006, 3080, 1200, 113000.00, 'Classic Princess ship offering elegant accommodations and worldwide itineraries'),
(5, 'Celebrity Edge', 'Edge', 2018, 2918, 1320, 129500.00, 'Revolutionary ship design with the Magic Carpet cantilevered platform'),
(6, 'Nieuw Amsterdam', 'Signature', 2010, 2106, 929, 86700.00, 'Mid-size ship perfect for exploring smaller ports with Dutch-inspired design'),
(7, 'Viking Star', 'Viking', 2015, 930, 465, 47800.00, 'Adult-only ship focusing on cultural immersion and destination experiences'),
(8, 'MSC Seaside', 'Seaside', 2017, 4140, 1413, 153516.00, 'Innovative ship designed to bring guests closer to the sea');

-- Insert sample destinations
INSERT INTO destinations (name, country, region, city, port_name, latitude, longitude, description, is_departure_port) VALUES
('Miami', 'USA', 'Caribbean', 'Miami', 'Port of Miami', 25.7617, -80.1918, 'Major cruise port serving as gateway to the Caribbean', true),
('Fort Lauderdale', 'USA', 'Caribbean', 'Fort Lauderdale', 'Port Everglades', 26.0942, -80.1169, 'Popular departure port for Caribbean cruises', true),
('Barcelona', 'Spain', 'Mediterranean', 'Barcelona', 'Port of Barcelona', 41.3851, 2.1734, 'Historic Mediterranean port with stunning architecture', true),
('Rome', 'Italy', 'Mediterranean', 'Rome', 'Port of Civitavecchia', 41.9028, 12.4964, 'Gateway to the Eternal City', true),
('Seattle', 'USA', 'Alaska', 'Seattle', 'Port of Seattle', 47.6062, -122.3321, 'Pacific Northwest departure port for Alaska cruises', true),
('Cozumel', 'Mexico', 'Caribbean', 'Cozumel', 'Port of Cozumel', 20.5083, -86.9458, 'Beautiful Mexican island known for diving and beaches', false),
('St. Thomas', 'US Virgin Islands', 'Caribbean', 'Charlotte Amalie', 'Crown Bay', 18.3381, -64.8941, 'Duty-free shopping paradise in the Caribbean', false),
('Nassau', 'Bahamas', 'Caribbean', 'Nassau', 'Prince George Wharf', 25.0833, -77.35, 'Capital of the Bahamas with Atlantis resort nearby', false),
('Santorini', 'Greece', 'Mediterranean', 'Thira', 'Port of Thira', 36.4167, 25.4167, 'Iconic Greek island with white buildings and blue domes', false),
('Juneau', 'USA', 'Alaska', 'Juneau', 'Port of Juneau', 58.3019, -134.4197, 'Alaska''s capital surrounded by glaciers and mountains', false),
('Ketchikan', 'USA', 'Alaska', 'Ketchikan', 'Berth 3', 55.3422, -131.6461, 'First city in Alaska known for totem poles and salmon', false),
('Venice', 'Italy', 'Mediterranean', 'Venice', 'Terminal San Basilio', 45.4408, 12.3155, 'Romantic city of canals and historic architecture', true);

-- Insert sample cruises
INSERT INTO cruises (cruise_line_id, ship_id, cruise_name, departure_port_id, departure_date, return_date, duration_nights, base_price, cruise_type, itinerary_description) VALUES
(1, 1, 'Ultimate Caribbean Adventure', 1, '2024-02-15', '2024-02-22', 7, 849.00, 'Caribbean', '7-night Western Caribbean cruise visiting Cozumel, Jamaica, and Perfect Day at CocoCay'),
(1, 2, 'Mediterranean Majesty', 3, '2024-05-10', '2024-05-17', 7, 1299.00, 'Mediterranean', '7-night Western Mediterranean visiting Rome, Florence, Monaco, and Barcelona'),
(2, 3, 'Bahamas Getaway', 2, '2024-03-01', '2024-03-04', 3, 299.00, 'Caribbean', '3-night cruise to Nassau with a day at Half Moon Cay'),
(3, 4, 'Alaska Inside Passage', 5, '2024-07-15', '2024-07-22', 7, 1599.00, 'Alaska', '7-night Alaska cruise through the Inside Passage visiting Juneau, Ketchikan, and Skagway'),
(4, 5, 'Caribbean Princess', 1, '2024-04-20', '2024-04-27', 7, 899.00, 'Caribbean', '7-night Eastern Caribbean visiting St. Thomas, St. Maarten, and Princess Cays'),
(5, 6, 'Greek Isles Explorer', 4, '2024-06-05', '2024-06-12', 7, 1899.00, 'Mediterranean', '7-night Greek Isles cruise visiting Santorini, Mykonos, and Rhodes'),
(6, 7, 'Alaska Glacier Discovery', 5, '2024-08-10', '2024-08-17', 7, 2299.00, 'Alaska', '7-night cruise featuring Glacier Bay National Park and scenic cruising'),
(7, 8, 'Northern Capitals', 12, '2024-09-01', '2024-09-11', 10, 3499.00, 'Northern Europe', '10-night cruise visiting Stockholm, Helsinki, St. Petersburg, and Copenhagen'),
(8, 9, 'Caribbean Seaside', 1, '2024-01-25', '2024-02-01', 7, 749.00, 'Caribbean', '7-night Eastern Caribbean with innovative ship design');

-- Insert cabin types
INSERT INTO cabin_types (ship_id, category_code, category_name, description, max_occupancy, size_sqft, has_balcony, has_ocean_view) VALUES
(1, 'IS', 'Interior Stateroom', 'Comfortable interior accommodation with modern amenities', 4, 150, false, false),
(1, 'OV', 'Ocean View', 'Stateroom with window overlooking the ocean', 4, 161, false, true),
(1, 'BAL', 'Balcony Stateroom', 'Private balcony with ocean views', 4, 182, true, true),
(1, 'SUI', 'Suite', 'Spacious suite with separate living area and premium amenities', 6, 350, true, true),
(2, 'IS', 'Interior Stateroom', 'Comfortable interior accommodation', 4, 172, false, false),
(2, 'BAL', 'Balcony Stateroom', 'Private balcony with ocean views', 4, 205, true, true),
(3, 'INT', 'Interior', 'Cozy interior stateroom', 4, 158, false, false),
(3, 'BAL', 'Balcony', 'Oceanview balcony stateroom', 4, 220, true, true);

-- Insert cruise pricing
INSERT INTO cruise_pricing (cruise_id, cabin_type_id, base_price, current_price, available_cabins) VALUES
(1, 1, 849.00, 749.00, 120),
(1, 2, 999.00, 899.00, 85),
(1, 3, 1199.00, 1099.00, 95),
(1, 4, 2499.00, 2299.00, 15),
(2, 5, 1299.00, 1199.00, 100),
(2, 6, 1699.00, 1599.00, 80),
(3, 7, 299.00, 279.00, 150),
(3, 8, 449.00, 399.00, 90);

-- Insert sample deals
INSERT INTO deals (cruise_id, deal_title, deal_description, discount_type, discount_value, original_price, deal_price, valid_from, valid_until, is_featured) VALUES
(1, 'Wave Season Sale', 'Save up to $100 per person plus free drinks package', 'fixed_amount', 100.00, 849.00, 749.00, '2024-01-01', '2024-03-31', true),
(2, 'Mediterranean Early Bird', '15% off plus onboard credit', 'percentage', 15.00, 1299.00, 1104.00, '2024-01-15', '2024-04-15', true),
(3, 'Last Minute Getaway', 'Quick escape to the Bahamas', 'fixed_amount', 20.00, 299.00, 279.00, '2024-02-15', '2024-02-28', false);

-- Insert sample users
INSERT INTO users (username, email, password_hash, first_name, last_name, total_cruises_taken, reviewer_level) VALUES
('cruise_lover_2024', 'john.smith@email.com', 'hashed_password_123', 'John', 'Smith', 15, 'Gold'),
('ocean_explorer', 'sarah.jones@email.com', 'hashed_password_456', 'Sarah', 'Jones', 8, 'Silver'),
('family_cruiser', 'mike.johnson@email.com', 'hashed_password_789', 'Mike', 'Johnson', 4, 'Bronze'),
('luxury_traveler', 'emily.davis@email.com', 'hashed_password_321', 'Emily', 'Davis', 22, 'Platinum'),
('adventure_seeker', 'david.wilson@email.com', 'hashed_password_654', 'David', 'Wilson', 11, 'Gold');

-- Insert sample ship reviews
INSERT INTO ship_reviews (user_id, ship_id, cruise_id, overall_rating, cabin_rating, food_rating, service_rating, entertainment_rating, value_rating, review_title, review_text, cruise_date, cabin_type, traveler_type, is_verified_cruise) VALUES
(1, 1, 1, 4.5, 4.0, 4.5, 5.0, 4.5, 4.0, 'Amazing Caribbean Adventure!', 'Had an incredible time on Symphony of the Seas. The ship is massive with so many activities. The food was excellent, especially the specialty restaurants. Service was outstanding throughout. Highly recommend the balcony cabin for the views!', '2024-02-15', 'Balcony', 'Couple', true),
(2, 3, 3, 4.0, 3.5, 4.0, 4.0, 4.5, 4.5, 'Great Value Bahamas Trip', 'Perfect short getaway! Carnival Celebration is a fun ship with lots of entertainment. The Bahamas were beautiful and Half Moon Cay was a highlight. Good value for a 3-night cruise.', '2024-03-01', 'Interior', 'Family', true),
(3, 4, 4, 5.0, 4.5, 4.0, 5.0, 4.0, 4.5, 'Alaska was Breathtaking', 'Norwegian Breakaway provided the perfect platform for exploring Alaska. The scenery was absolutely stunning. Staff was very knowledgeable about the destinations. Highly recommend for first-time Alaska cruisers.', '2024-07-15', 'Balcony', 'Couple', true),
(4, 6, 6, 4.8, 5.0, 4.5, 4.5, 4.0, 4.0, 'Elegant Greek Isles Experience', 'Celebrity Edge delivered a sophisticated cruise experience. The accommodations were luxurious and the service impeccable. Greek islands were magical - Santorini sunset was unforgettable!', '2024-06-05', 'Suite', 'Couple', true),
(5, 8, 8, 4.2, 4.0, 4.0, 4.5, 3.5, 4.0, 'Cultural Northern Europe Journey', 'Viking Star provided an enriching cultural experience. Adult-only environment was peaceful. Shore excursions were well-organized and informative. St. Petersburg was the highlight.', '2024-09-01', 'Veranda', 'Couple', true);

-- Insert cruise itinerary
INSERT INTO cruise_itinerary (cruise_id, destination_id, day_number, arrival_time, departure_time, is_sea_day, port_activities) VALUES
(1, 1, 1, NULL, '17:00', false, 'Departure from Miami - boarding and muster drill'),
(1, 6, 2, '08:00', '17:00', false, 'Explore Cozumel - snorkeling, beach time, Mayan ruins'),
(1, NULL, 3, NULL, NULL, true, 'Day at sea - enjoy ship amenities, shows, and dining'),
(1, 8, 4, '07:00', '15:00', false, 'Nassau - visit Atlantis, duty-free shopping, beach excursions'),
(1, NULL, 5, NULL, NULL, true, 'Perfect Day at CocoCay - private island experience'),
(1, NULL, 6, NULL, NULL, true, 'Final sea day - farewell dinner and shows'),
(1, 1, 7, '06:00', NULL, false, 'Return to Miami - disembarkation');

-- Insert forum categories
INSERT INTO forum_categories (name, description, sort_order) VALUES
('Welcome to Cruise Critic', 'New member introductions and general cruise discussion', 1),
('Cruise Lines', 'Discussion about specific cruise lines and their ships', 2),
('Destinations', 'Talk about cruise destinations and ports of call', 3),
('First Time Cruisers', 'Advice and tips for cruise newcomers', 4),
('Cruise Reviews', 'Share your cruise experiences and reviews', 5),
('Special Interest Cruising', 'Themed cruises, group cruises, and special occasions', 6),
('Roll Calls', 'Meet other cruisers on your sailing', 7);

-- Insert sample forum topics
INSERT INTO forum_topics (category_id, user_id, title, view_count, reply_count) VALUES
(1, 1, 'New to cruising - excited for first Caribbean cruise!', 245, 12),
(2, 2, 'Royal Caribbean vs Norwegian - which do you prefer?', 532, 28),
(3, 3, 'Best excursions in Cozumel?', 189, 15),
(4, 4, 'What to pack for Alaska cruise in July?', 421, 22),
(5, 5, 'Just back from amazing Greek Isles cruise - AMA!', 356, 18),
(7, 1, 'Roll call: Symphony of the Seas February 15, 2024', 67, 8);

-- Insert sample articles
INSERT INTO articles (author_id, title, slug, content, excerpt, category, is_published, view_count, is_featured) VALUES
(1, '10 Things Every First-Time Cruiser Should Know', '10-things-first-time-cruiser', 'Embarking on your first cruise can be exciting but also overwhelming. Here are 10 essential tips...', 'Essential tips for cruise newcomers to make the most of their first sailing experience.', 'Tips', true, 1542, true),
(2, 'Best Cruise Ships for Families in 2024', 'best-family-cruise-ships-2024', 'Planning a family cruise? These ships offer the best amenities and activities for all ages...', 'Discover the top family-friendly cruise ships with activities for kids and adults alike.', 'Ship Reviews', true, 987, true),
(3, 'Mediterranean Cruise Packing Guide', 'mediterranean-cruise-packing-guide', 'Packing for a Mediterranean cruise requires planning for various climates and activities...', 'Complete packing checklist for your Mediterranean cruise adventure.', 'Guides', true, 743, false);

-- Insert some forum posts
INSERT INTO forum_posts (topic_id, user_id, content) VALUES
(1, 2, 'Welcome to cruising! You''re going to love it. Make sure to book your specialty dining and excursions early!'),
(1, 3, 'So exciting! I remember my first cruise - you''ll have an amazing time. Don''t forget to bring sunscreen!'),
(2, 1, 'I''ve sailed with both and honestly prefer Royal Caribbean for their innovative ships and entertainment.'),
(2, 4, 'NCL''s freestyle cruising is great if you don''t like formal nights and want more flexible dining.'),
(3, 5, 'Chankanaab Park is amazing for snorkeling! The coral reefs are beautiful and well-preserved.');

-- Insert some review votes
INSERT INTO review_votes (review_id, user_id, is_helpful) VALUES
(1, 2, true),
(1, 3, true),
(1, 4, true),
(2, 1, true),
(2, 4, true),
(3, 1, true),
(3, 2, true);

-- Insert sample bookings
INSERT INTO bookings (user_id, cruise_id, cabin_type_id, booking_reference, number_of_passengers, total_amount, booking_status, payment_status) VALUES
(1, 1, 3, 'RC240215001', 2, 2198.00, 'confirmed', 'paid'),
(2, 3, 7, 'CC240301002', 4, 1116.00, 'confirmed', 'paid'),
(3, 4, 8, 'NCL240715003', 2, 3198.00, 'pending', 'pending');

-- Insert booking passengers
INSERT INTO booking_passengers (booking_id, first_name, last_name, date_of_birth, is_primary_contact) VALUES
(1, 'John', 'Smith', '1985-03-15', true),
(1, 'Jane', 'Smith', '1987-07-22', false),
(2, 'Mike', 'Johnson', '1979-11-08', true),
(2, 'Lisa', 'Johnson', '1981-02-14', false),
(2, 'Tommy', 'Johnson', '2010-05-30', false),
(2, 'Emma', 'Johnson', '2012-09-12', false);