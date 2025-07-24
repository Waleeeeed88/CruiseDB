CREATE TABLE Itineraries (
    ItineraryID INT PRIMARY KEY AUTO_INCREMENT,
    ShipID INT NOT NULL,
    ItineraryName VARCHAR(255) NOT NULL,
    DurationDays INT NOT NULL,
    Destination VARCHAR(100),
    FOREIGN KEY (ShipID) REFERENCES Ships(ShipID),
    CONSTRAINT chk_DurationDays CHECK (DurationDays > 0)
);

CREATE TABLE ItineraryPorts (
    ItineraryID INT NOT NULL,
    PortID INT NOT NULL,
    DayNumber INT NOT NULL,
    PortCallType VARCHAR(20),
    PRIMARY KEY (ItineraryID, DayNumber),
    FOREIGN KEY (ItineraryID) REFERENCES Itineraries(ItineraryID),
    FOREIGN KEY (PortID) REFERENCES Ports(PortID),
    CONSTRAINT chk_PortCallType CHECK (PortCallType IN ('Embark', 'Debark', 'Port of Call'))
);

CREATE TABLE Sailings (
    SailingID INT PRIMARY KEY AUTO_INCREMENT,
    ItineraryID INT NOT NULL,
    DepartureDate DATE NOT NULL,
    BasePrice DECIMAL(10, 2) NOT NULL,
    DealDescription VARCHAR(255),
    FOREIGN KEY (ItineraryID) REFERENCES Itineraries(ItineraryID)
);