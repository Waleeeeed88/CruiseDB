CREATE TABLE CruiseLines (
    LineID INT PRIMARY KEY AUTO_INCREMENT,
    LineName VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);

CREATE TABLE Ships (
    ShipID INT PRIMARY KEY AUTO_INCREMENT,
    LineID INT NOT NULL,
    ShipName VARCHAR(100) NOT NULL,
    ShipType VARCHAR(50),
    PassengerCapacity INT,
    YearBuilt INT,
    FOREIGN KEY (LineID) REFERENCES CruiseLines(LineID),
    CONSTRAINT chk_ShipType CHECK (ShipType IN ('Ocean', 'River', 'Luxury', 'Expedition'))
);

CREATE TABLE Ports (
    PortID INT PRIMARY KEY AUTO_INCREMENT,
    PortName VARCHAR(100) NOT NULL,
    Country VARCHAR(100)
);
