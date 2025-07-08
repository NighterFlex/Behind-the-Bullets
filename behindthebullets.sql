#game db - improved
CREATE DATABASE GameIMPROVED;
USE GameIMPROVED;

CREATE TABLE Player (
    PlayerId INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Email VARCHAR(100),
    PasswordHashMD5 VARCHAR(100),
    RegDate DATE,
    LastLogin DATE
);

INSERT INTO Player (PlayerId, Username, Email, PasswordHashMD5, RegDate, LastLogin) VALUES
(1, 'TenZ', 'tenz@sentinels.gg', '8c7433f59f986ef5ed8cc39216669c9c', '2022-01-10', '2025-05-12'),
(2, 'yay', 'yay@c9.gg', 'c9b1a49d489219f6a69589fc8f3afba4', '2022-02-20', '2025-05-11'),
(3, 'Derke', 'derke@fnatic.gg', '29a5913d672d34d7f343b597f90eabd3', '2022-03-15', '2025-05-10'),
(4, 'Aspas', 'aspas@loud.gg', '27396415ffd3d453107db022a8a66439', '2022-04-18', '2025-05-09'),
(5, 'ScreaM', 'scream@kc.gg', '066e2892962bfcaff5616639fde1a979', '2022-05-22', '2025-05-08'),
(6, 'nAts', 'nats@gambit.gg', 'b45b7a90555db54e8ba2f4804cd8e7f3', '2022-06-15', '2025-05-07'),
(7, 'Zyppan', 'zyppan@giants.gg', '6ed96625e246f8bc4d8a35a7f43917a4', '2022-07-10', '2025-05-06'),
(8, 'Leaf', 'leaf@c9.gg', '452fa60f16a7861a707ec0e2db7b1e87', '2022-08-05', '2025-05-05'),
(9, 'Keznit', 'keznit@lev.gg', '12ca995610a44a9eed3af722b8947e23', '2022-09-01', '2025-05-04'),
(10, 'Chronicle', 'chronicle@fnc.gg', '0aac0bd5b70b514d14339b22fd6e21ea', '2022-10-01', '2025-05-03');



CREATE TABLE RANKS (
    RankId INT PRIMARY KEY,
    RankName VARCHAR(30),
    Tier INT
);

INSERT INTO RANKS (RankId, RankName, Tier) VALUES
(1, 'Iron', 1),
(2, 'Bronze', 2),
(3, 'Silver', 3),
(4, 'Gold', 4),
(5, 'Platinum', 5),
(6, 'Diamond', 6),
(7, 'Ascendant', 7),
(8, 'Immortal', 8),
(9, 'Radiant', 9);


CREATE TABLE RANKING (
    PlayerId INT PRIMARY KEY,
    RankId INT,
    Rating INT,
    LeaderboardPosition INT,
    FOREIGN KEY (PlayerId) REFERENCES PLAYER(PlayerId),
    FOREIGN KEY (RankId) REFERENCES RANKS(RankId)
);

INSERT INTO RANKING (PlayerId, RankId, Rating, LeaderboardPosition) VALUES
(1, 9, 450, 1),
(2, 8, 420, 5),
(3, 7, 400, 3),
(4, 9, 460, 4),
(5, 6, 390, 2),
(6, 8, 410, 6),
(7, 7, 395, 7),
(8, 6, 385, 8),
(9, 7, 398, 10),
(10, 5, 370, 9);


CREATE TABLE PLAYER_STATS (
    PlayerId INT PRIMARY KEY,
    Level INT,
    XP INT,
    FOREIGN KEY (PlayerId) REFERENCES Player(PlayerId)
);

INSERT INTO PLAYER_STATS (PlayerId, Level, XP) VALUES
(1, 12, 12000),
(2, 11, 11500),
(3, 10, 11000),
(4, 13, 13000),
(5, 9, 9000),
(6, 11, 11200),
(7, 10, 10700),
(8, 9, 9500),
(9, 10, 10800),
(10, 8, 8500);



CREATE TABLE AGENT (
    AgentId INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30)
);

INSERT INTO AGENT (AgentId, Name, Role) VALUES
(1, 'Brimstone', 'Controller'),
(2, 'Viper', 'Controller'),
(3, 'Omen', 'Controller'),
(4, 'Astra', 'Controller'),
(5, 'Harbor', 'Controller'),
(6, 'Phoenix', 'Duelist'),
(7, 'Jett', 'Duelist'),
(8, 'Reyna', 'Duelist'),
(9, 'Yoru', 'Duelist'),
(10, 'Raze', 'Duelist'),
(11, 'Neon', 'Duelist'),
(12, 'Iso', 'Duelist'),
(13, 'Sova', 'Initiator'),
(14, 'Breach', 'Initiator'),
(15, 'Skye', 'Initiator'),
(16, 'KAY/O', 'Initiator'),
(17, 'Fade', 'Initiator'),
(18, 'Gekko', 'Initiator'),
(19, 'Cypher', 'Sentinel'),
(20, 'Killjoy', 'Sentinel'),
(21, 'Sage', 'Sentinel'),
(22, 'Chamber', 'Sentinel'),
(23, 'Deadlock', 'Sentinel');



CREATE TABLE WEAPON (
    WeaponId INT PRIMARY KEY,
    Name VARCHAR(50),
    Type VARCHAR(30),
    Damage INT
);

INSERT INTO WEAPON (WeaponId, Name, Type, Damage) VALUES
(1, 'Vandal', 'Rifle', 160),
(2, 'Phantom', 'Rifle', 156),
(3, 'Operator', 'Sniper', 255),
(4, 'Sheriff', 'Pistol', 160),
(5, 'Ghost', 'Pistol', 105);



CREATE TABLE SKIN (
    SkinId INT PRIMARY KEY,
    WeaponId INT,
    Name VARCHAR(50),
    Rarity VARCHAR(20),
    UnlockStatus VARCHAR(20),
    FOREIGN KEY (WeaponId) REFERENCES WEAPON(WeaponId)
);

INSERT INTO SKIN (SkinId, WeaponId, Name, Rarity, UnlockStatus) VALUES
(1, 1, 'Elderflame Vandal', 'Legendary', 'Unlocked'),
(2, 2, 'Prime Phantom', 'Legendary', 'Unlocked'),
(3, 3, 'Reaver Operator', 'Epic', 'Unlocked'),
(4, 4, 'Ion Sheriff', 'Rare', 'Unlocked'),
(5, 5, 'Sovereign Ghost', 'Rare', 'Unlocked');


CREATE TABLE INVENTORY (
    PlayerId INT,
    SkinId INT,
    AcquisitionDate DATE,
    PRIMARY KEY (PlayerId, SkinId),
    FOREIGN KEY (PlayerId) REFERENCES PLAYER(PlayerId),
    FOREIGN KEY (SkinId) REFERENCES SKIN(SkinId)
);

INSERT INTO INVENTORY (PlayerId, SkinId, AcquisitionDate) VALUES
(1, 1, '2023-03-01'),
(1, 2, '2023-04-01'),
(2, 2, '2023-03-02'),
(3, 3, '2023-03-03'),
(4, 4, '2023-03-04'),
(5, 5, '2023-03-05'),
(5, 2, '2024-05-04'),

(6, 3, '2023-06-06'),
(8, 5, '2023-08-08'),
(9, 2, '2023-09-09');

CREATE TABLE PURCHASE (
    PurchaseId INT PRIMARY KEY,
    SkinId INT,
    PlayerId INT,
    Date DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (SkinId) REFERENCES SKIN(SkinId),
    FOREIGN KEY (PlayerId) REFERENCES PLAYER(PlayerId)
);

INSERT INTO PURCHASE (PurchaseId, SkinId, PlayerId, Date, Amount) VALUES
(1, 1, 1, '2023-03-01', 1775.00),
(2, 2, 1, '2023-04-01', 1775.00),
(3, 2, 2, '2023-03-02', 1775.00),
(4, 3, 3, '2023-03-03', 1775.00),
(5, 4, 4, '2023-03-04', 1775.00),

(6, 5, 5, '2023-03-05', 1775.00),
(7, 3, 6, '2023-06-06', 1775.00),
(8, 4, 7, '2023-07-07', 1775.00),
(9, 5, 8, '2023-08-08', 1775.00),
(10, 2, 9, '2023-09-09', 1775.00),
(11, 1, 10, '2023-10-10', 1775.00);



CREATE TABLE MATCHES (
    MatchId INT PRIMARY KEY,
    Map VARCHAR(50),
    StartTime DATETIME,
    EndTime DATETIME
);

INSERT INTO MATCHES (MatchId, Map, StartTime, EndTime) VALUES
(1, 'Ascent', '2025-05-10 17:00:00', '2025-05-10 17:35:00'),
(2, 'Haven', '2024-05-11 16:45:00', '2024-05-11 17:20:00'),
(3, 'Icebox', '2025-05-12 18:00:00', '2025-05-12 18:30:00'),
(4, 'Bind', '2025-05-13 19:00:00', '2025-05-13 19:25:00'),
(5, 'Lotus', '2020-05-13 20:00:00', '2020-05-13 20:30:00');



CREATE TABLE MATCH_STATS (
    PlayerId INT,
    MatchId INT,
    Kills INT,
    Deaths INT,
    Results VARCHAR(20),
    PRIMARY KEY (PlayerId, MatchId),
    FOREIGN KEY (PlayerId) REFERENCES PLAYER(PlayerId),
    FOREIGN KEY (MatchId) REFERENCES MATCHES(MatchId)
);

INSERT INTO MATCH_STATS (PlayerId, MatchId, Kills, Deaths, Results) VALUES
(1, 1, 20, 15, 'Win'),
(2, 1, 18, 12, 'Win'),
(3, 1, 22, 8, 'Win'),
(4, 1, 17, 11, 'Win'),
(5, 1, 15, 9, 'Win'),

(6, 2, 0, 15, 'Loss'),
(7, 2, 1, 12, 'Loss'),
(8, 2, 2, 8, 'Loss'),
(9, 2, 1, 11, 'Loss'),
(10, 2, 0, 9, 'Loss'),


(1, 2, 2, 15, 'Loss'),
(6, 2, 8, 12, 'Loss'),
(3, 2, 2, 8, 'Loss'),
(9, 2, 1, 11, 'Loss'),
(5, 2, 0, 9, 'Loss'),

(2, 2, 20, 5, 'Win'),
(7, 2, 18, 0, 'Win'),
(8, 2, 20, 8, 'Win'),
(4, 2, 12, 1, 'Win'),
(10, 2, 6, 9, 'Win');



CREATE TABLE PLAYER_AGENT_USAGE (
    PlayerId INT,
    MatchId INT,
    AgentId INT,
    PRIMARY KEY (PlayerId, MatchId),
    FOREIGN KEY (PlayerId) REFERENCES Player(PlayerId),
    FOREIGN KEY (MatchId) REFERENCES Matches(MatchId),
    FOREIGN KEY (AgentId) REFERENCES Agent(AgentId)
);

INSERT INTO PLAYER_AGENT_USAGE (PlayerId, MatchId, AgentId) VALUES
(1, 1, 7),
(2, 1, 8),
(3, 1, 9),
(4, 1, 10),
(5, 1, 11),

(6, 1, 2),
(7, 1, 1),
(8, 1, 22),
(9, 1, 10),
(10, 1, 12),


(1, 2, 2),
(6, 2, 1),
(3, 2, 9),
(9, 2, 17),
(5, 2, 12),

(2, 2, 7),
(7, 2, 2),
(8, 2, 9),
(4, 2, 10),
(10, 2, 1);


CREATE TABLE PLAYER_WEAPON_USAGE (
    PlayerId INT,
    MatchId INT,
    WeaponId INT,
    PRIMARY KEY (PlayerId, MatchId),
    FOREIGN KEY (PlayerId) REFERENCES Player(PlayerId),
    FOREIGN KEY (MatchId) REFERENCES Matches(MatchId),
    FOREIGN KEY (WeaponId) REFERENCES Weapon(WeaponId)
);

INSERT INTO PLAYER_WEAPON_USAGE (PlayerId, MatchId, WeaponId) VALUES
(1, 1, 1),
(1, 1, 3),  #player 1 uses weapon 3 as well
(2, 1, 2),
(2, 1, 4),  #player 2 uses weapon 4 too
(3, 1, 3),
(3, 1, 5),  #player 3 uses weapon 5 too
(4, 1, 4),
(5, 1, 5),
(6, 1, 1),
(6, 1, 2),
(7, 1, 3),
(8, 1, 4),
(8, 1, 5),
(9, 1, 1),
(10, 1, 2),
(10, 1, 3);






