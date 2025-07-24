CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE NOT NULL DEFAULT (CURDATE())
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    SailingID INT NOT NULL,
    UserID INT NOT NULL,
    ReviewTitle VARCHAR(255),
    ReviewText TEXT,
    OverallRating INT NOT NULL,
    ReviewDate DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (SailingID) REFERENCES Sailings(SailingID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT chk_OverallRating CHECK (OverallRating BETWEEN 1 AND 5)
);

CREATE TABLE Articles (
    ArticleID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    Category VARCHAR(50),
    PublishDate DATETIME NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_Category CHECK (Category IN ('Destination Guide', 'Advice', 'News'))
);