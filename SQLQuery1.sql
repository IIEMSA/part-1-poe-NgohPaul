CREATE DATABASE EventEaseDB;
GO

USE EventEaseDB;
GO

CREATE TABLE Venue (
    VenueId INT PRIMARY KEY IDENTITY(1,1),
    VenueName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Capacity INT NOT NULL,
    ImageUrl VARCHAR(500)
);

CREATE TABLE Event (
    EventId INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(255) NOT NULL,
    EventDate DATETIME NOT NULL,
    Description TEXT,
    VenueId INT,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId) ON DELETE SET NULL
);

CREATE TABLE Booking (
    BookingId INT PRIMARY KEY IDENTITY(1,1),
    EventId INT NOT NULL,
    VenueId INT NOT NULL,
    BookingDate DATETIME NOT NULL,
    FOREIGN KEY (EventId) REFERENCES Event(EventId) ON DELETE CASCADE,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId) ON DELETE CASCADE
);

-- Sample Data Insertion
INSERT INTO Venue (VenueName, Location, Capacity, ImageUrl) VALUES
('Grand Hall', '123 Main St', 500, 'https://example.com/venue1.jpg'),
('Conference Center', '456 Broad Ave', 300, 'https://example.com/venue2.jpg'),
('Outdoor Pavilion', '789 Park Lane', 1000, 'https://example.com/venue3.jpg');

INSERT INTO Event (EventName, EventDate, Description, VenueId) VALUES
('Tech Conference', '2025-06-15 10:00:00', 'Annual Tech Meetup', 1),
('Wedding Expo', '2025-07-20 12:00:00', 'Showcase of wedding services', 2),
('Music Festival', '2025-08-10 18:00:00', 'Live music performances', 3);

INSERT INTO Booking (EventId, VenueId, BookingDate) VALUES
(1, 1, '2025-06-01 09:00:00'),
(2, 2, '2025-07-05 10:30:00'),
(3, 3, '2025-07-25 14:00:00');

