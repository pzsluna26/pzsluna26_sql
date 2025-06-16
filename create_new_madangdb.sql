CREATE TABLE `new_book` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `bname` varchar(45) NOT NULL,
  `pubname` varchar(45) NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `custid` int DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
