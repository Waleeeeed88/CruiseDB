SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ForumPosts;
TRUNCATE TABLE ForumThreads;
TRUNCATE TABLE Articles;
TRUNCATE TABLE Reviews;
TRUNCATE TABLE Users;
TRUNCATE TABLE Sailings;
TRUNCATE TABLE ItineraryPorts;
TRUNCATE TABLE Itineraries;
TRUNCATE TABLE Ports;
TRUNCATE TABLE Ships;
TRUNCATE TABLE CruiseLines;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO CruiseLines (LineID, LineName, Description) VALUES
(1, 'Celestial Cruises', 'Luxury space-themed cruises.'),
(2, 'Royal Atlantic', 'The biggest ships for the biggest adventures.'),
(3, 'Carnival Fun Lines', 'The most fun you can have at sea.'),
(4, 'Viking River Tours', 'Explore the world''s great rivers in comfort.'),
(5, 'Norwegian Escape', 'Freestyle cruising with no set schedules.');

INSERT INTO Ships (ShipID, LineID, ShipName, ShipType, PassengerCapacity, YearBuilt) VALUES
(1, 1, 'Odyssey Star', 'Luxury', 3000, 2022),
(2, 2, 'Goliath of the Seas', 'Ocean', 6500, 2021),
(3, 2, 'Explorer of the Tides', 'Ocean', 5500, 2018),
(4, 3, 'Carnival Celebration', 'Ocean', 5200, 2022),
(5, 4, 'Viking Odin', 'River', 190, 2012),
(6, 4, 'Viking Rinda', 'River', 190, 2014),
(7, 5, 'Norwegian Bliss', 'Ocean', 4004, 2018);

INSERT INTO Ports (PortID, PortName, Country) VALUES
(1, 'Port Canaveral', 'USA'),
(2, 'Nassau', 'Bahamas'),
(3, 'St. Thomas', 'US Virgin Islands'),
(4, 'Miami', 'USA'),
(5, 'Cozumel', 'Mexico'),
(6, 'Juneau', 'USA'),
(7, 'Skagway', 'USA'),
(8, 'Amsterdam', 'Netherlands'),
(9, 'Budapest', 'Hungary'),
(10, 'Seattle', 'USA'),
(11, 'Barcelona', 'Spain'),
(12, 'Rome (Civitavecchia)', 'Italy');

INSERT INTO Itineraries (ItineraryID, ShipID, ItineraryName, DurationDays, Destination) VALUES
(1, 1, '7-Night Eastern Caribbean', 7, 'Caribbean'),
(2, 2, '7-Night Western Caribbean', 7, 'Caribbean'),
(3, 7, '7-Day Alaska Explorer', 7, 'Alaska'),
(4, 5, '15-Day Grand European Tour', 15, 'Europe River'),
(5, 3, '10-Day Mediterranean Dream', 10, 'Mediterranean');

INSERT INTO ItineraryPorts (ItineraryID, PortID, DayNumber, PortCallType) VALUES
(1, 1, 1, 'Embark'), (1, 2, 3, 'Port of Call'), (1, 3, 5, 'Port of Call'), (1, 1, 8, 'Debark'),
(2, 4, 1, 'Embark'), (2, 5, 3, 'Port of Call'), (2, 4, 8, 'Debark'),
(3, 10, 1, 'Embark'), (3, 6, 3, 'Port of Call'), (3, 7, 4, 'Port of Call'), (3, 10, 8, 'Debark'),
(4, 8, 1, 'Embark'), (4, 9, 15, 'Debark'),
(5, 11, 1, 'Embark'), (5, 12, 5, 'Port of Call'), (5, 11, 11, 'Debark');

INSERT INTO Sailings (SailingID, ItineraryID, DepartureDate, BasePrice, DealDescription) VALUES
(1, 1, '2025-11-15', 1499.00, 'Last Minute Deal: 20% off!'),
(2, 1, '2025-12-06', 1599.00, NULL),
(3, 2, '2025-10-25', 999.00, 'Kids Sail Free!'),
(4, 2, '2025-11-08', 950.00, NULL),
(5, 3, '2026-06-12', 2499.00, NULL),
(6, 3, '2026-07-03', 2799.00, '4th of July Special'),
(7, 4, '2026-05-20', 4999.00, 'Book Early & Save $500'),
(8, 5, '2026-09-01', 3250.00, NULL);

INSERT INTO Users (UserID, Username, Email, JoinDate) VALUES
(1, 'CruiseFan123', 'fan@test.com', '2024-01-15'),
(2, 'TravelerJane', 'jane@test.com', '2024-02-20'),
(3, 'SeaLover88', 'sea@test.com', '2024-03-10'),
(4, 'AdventureAlex', 'alex@test.com', '2024-05-01'),
(5, 'BudgetCruiser', 'budget@test.com', '2024-06-22'),
(6, 'RiverExplorer', 'river@test.com', '2024-07-30'),
(7, 'FirstTimerTom', 'tom@test.com', '2025-01-05');

INSERT INTO Reviews (ReviewID, SailingID, UserID, ReviewTitle, ReviewText, OverallRating, ReviewDate) VALUES
(1, 1, 1, 'Amazing Ship!', 'The Odyssey Star was fantastic. Great service and food.', 5, '2025-11-25'),
(2, 3, 4, 'So much fun on the Goliath!', 'The ship is huge and there''s so much to do. Cozumel was beautiful.', 4, '2025-11-05'),
(3, 3, 5, 'Great value for the price', 'For what we paid, it was a great vacation. The buffet was a bit crowded though.', 3, '2025-11-06'),
(4, 5, 2, 'Alaska is breathtaking', 'The Norwegian Bliss was the perfect ship for our Alaskan adventure. The glaciers were stunning.', 5, '2026-06-22'),
(5, 7, 6, 'The best way to see Europe', 'Viking knows how to do river cruising. Everything was handled perfectly from start to finish.', 5, '2026-06-10');

INSERT INTO Articles (ArticleID, Title, Content, Category, PublishDate) VALUES
(1, 'Top 5 Excursions in Nassau', 'Detailed guide to excursions...', 'Destination Guide', '2025-02-10 11:00:00'),
(2, 'What to Pack for a Caribbean Cruise', 'A comprehensive checklist for first-timers.', 'Advice', '2025-03-15 09:30:00'),
(3, 'Royal Atlantic Unveils New ''Titan of the Tides'' Ship', 'Get the first look at the next biggest ship in the world.', 'News', '2025-07-24 14:00:00');

INSERT INTO ForumThreads (ThreadID, UserID, Title, CreationDate) VALUES
(1, 2, 'First time on Celestial Cruises - any tips?', '2025-04-10 18:30:00'),
(2, 7, 'Best shore excursion in Juneau?', '2025-05-20 12:00:00'),
(3, 5, 'Is the "Kids Sail Free" deal worth it?', '2025-06-01 20:00:00');

INSERT INTO ForumPosts (PostID, ThreadID, UserID, PostText, PostDate) VALUES
(1, 1, 1, 'Definitely check out the zero-gravity spa!', '2025-04-10 19:00:00'),
(2, 1, 3, 'I second that! And the food at the Galaxy Grill is out of this world.', '2025-04-11 09:15:00'),
(3, 2, 4, 'The whale watching tour was unforgettable. We saw so many humpbacks!', '2025-05-20 13:00:00'),
(4, 2, 2, 'Thanks for the tip, Alex! I was also looking at the Mendenhall Glacier tour.', '2025-05-20 14:30:00'),
(5, 3, 4, 'Absolutely. We took our two kids and only had to pay taxes and port fees. Saved us a ton.', '2025-06-02 10:00:00');
