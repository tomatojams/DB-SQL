-- mart.product definition

CREATE TABLE `product` (
                           `상품명` varchar(100) NOT NULL,
                           `가테고리` varchar(100) NOT NULL,
                           `가격` int DEFAULT NULL,
                           `costomerID` int NOT NULL AUTO_INCREMENT,
                           PRIMARY KEY (`costomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;