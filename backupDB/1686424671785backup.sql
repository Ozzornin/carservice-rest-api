/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cars
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `vin` varchar(17) NOT NULL,
  `clientId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vin` (`vin`),
  KEY `cars_ibfk_1` (`clientId`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 95 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: carspareparts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `carspareparts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL,
  `partNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 54 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: clients
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  UNIQUE KEY `address` (`address`),
  UNIQUE KEY `email` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 580 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL DEFAULT (curdate()),
  `description` text,
  `status` varchar(255) NOT NULL,
  `cost` decimal(10, 2) DEFAULT NULL,
  `carId` int NOT NULL,
  `workerId` int DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workerId` (`workerId`),
  KEY `orders_ibfk_1` (`carId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`workerId`) REFERENCES `workers` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 241 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orderspareparts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orderspareparts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `partId` int NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partId` (`partId`),
  KEY `orderspareparts_ibfk_1` (`orderId`),
  CONSTRAINT `orderspareparts_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orderspareparts_ibfk_2` FOREIGN KEY (`partId`) REFERENCES `carspareparts` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 240 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: workers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `workers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cars
# ------------------------------------------------------------

INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (24, 'Audi', 'A4', 2019, 'WAUZZZ8K9J0T23456', 508);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    25,
    'Volkswagen',
    'Golf',
    2020,
    'WVWZZZAU7J0T34567',
    509
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    26,
    'Mercedes-Benz',
    'C-Class',
    2017,
    'WDDZF4JB5J0T45678',
    510
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (27, 'Toyota', 'Camry', 2018, '4T1B11HK9J0T56789', 511);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (28, 'Honda', 'Accord', 2019, '1HGCV2F34J0T67890', 512);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (29, 'Ford', 'Focus', 2020, 'WF0FXXWPFJ0T78901', 513);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    30,
    'Chevrolet',
    'Cruze',
    2017,
    '1G1BC5SM9J0T89012',
    514
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    31,
    'Nissan',
    'Altima',
    2018,
    '1N4AL3AP3J0T90123',
    515
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    32,
    'Hyundai',
    'Elantra',
    2019,
    'KMHD74KF8J0T01234',
    516
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (33, 'Kia', 'Optima', 2020, '5XXGT4L3J0T12345', 517);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (34, 'Volvo', 'S60', 2017, 'YV1FS8FH7J0T23456', 518);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (35, 'Mazda', 'CX-5', 2018, 'JM3KFBDM8J0T34567', 519);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    36,
    'Subaru',
    'Forester',
    2019,
    'JF2SJAGC9J0T45678',
    520
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (37, 'Lexus', 'RX', 2020, '2T2ZZMCA4J0T56789', 521);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (38, 'Infiniti', 'Q50', 2017, 'JN1EV7AP3J0T67890', 522);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    39,
    'Land Rover',
    'Range Rover',
    2018,
    'SALGS2GK8J0T78901',
    523
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    40,
    'Porsche',
    'Cayenne',
    2019,
    'WP1AA2A29J0T89012',
    524
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (41, 'Jaguar', 'XF', 2020, 'SAJAH2EK9J0T90123', 525);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (42, 'Acura', 'TLX', 2017, '19UUB1F36J0T01234', 526);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    43,
    'Lamborghini',
    'Huracan',
    2018,
    'ZHWUR1ZF4J0T12345',
    527
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (44, 'Ferrari', '488', 2019, 'ZFF79ALA8J0T23456', 528);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    45,
    'Maserati',
    'Ghibli',
    2020,
    'ZAM57XSA9J0T34567',
    529
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    46,
    'Alfa Romeo',
    'Giulia',
    2017,
    'ZARFAEBN0J0T45678',
    530
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    47,
    'Jeep',
    'Grand Cherokee',
    2018,
    '1C4RJFAG4J0T56789',
    531
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (48, 'Chrysler', '300', 2019, '2C3CCAEG8J0T67890', 532);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    49,
    'Dodge',
    'Charger',
    2020,
    '2C3CDXBG1J0T78901',
    533
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (50, 'RAM', '1500', 2017, '1C6RR7FG8J0T89012', 534);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (51, 'GMC', 'Sierra', 2018, '3GTU2NEJ8J0T90123', 535);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    52,
    'Cadillac',
    'Escalade',
    2019,
    '1GYS4DKJ9J0T01234',
    536
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    53,
    'Buick',
    'Enclave',
    2020,
    '5GAEVAKW8J0T12345',
    537
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    54,
    'Lincoln',
    'Navigator',
    2017,
    '5LMJJ3LT4J0T23456',
    538
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    55,
    'Tesla',
    'Model S',
    2018,
    '5YJSA1E47J0T34567',
    539
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    56,
    'Mitsubishi',
    'Outlander',
    2019,
    'JA4AZ3A39J0T45678',
    540
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (57, 'Suzuki', 'Swift', 2020, 'JSAAZC13S0T56789', 541);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    58,
    'Volkswagen',
    'Golf',
    2015,
    'WVWZZZ1KZFW123456',
    507
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    59,
    'Renault',
    'Megane',
    2017,
    'VF1RFA23456789012',
    508
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (60, 'BMW', 'X5', 2019, 'WBAKJ234567890123', 509);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    61,
    'Mercedes-Benz',
    'C-Class',
    2016,
    'WDDWF123456789012',
    510
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    62,
    'Toyota',
    'Corolla',
    2018,
    'JTDDH345678901234',
    511
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    63,
    'Nissan',
    'Qashqai',
    2015,
    'SJNFBA45678901234',
    512
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (64, 'Audi', 'A4', 2017, 'WAUZZZ56789012345', 513);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (65, 'Ford', 'Focus', 2016, 'WF0GXX12345678901', 514);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (66, 'Opel', 'Astra', 2018, 'W0L0A123456789012', 515);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    67,
    'Hyundai',
    'Tucson',
    2019,
    'KM8JU456789012345',
    516
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (68, 'Kia', 'Sportage', 2017, 'U5YPC123456789012', 517);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (69, 'Honda', 'Civic', 2016, 'SHHEP123456789012', 518);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (70, 'Mazda', '3', 2018, 'JMZBM123456789012', 519);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    71,
    'Subaru',
    'Impreza',
    2015,
    'JF1GP123456789012',
    520
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    72,
    'Mitsubishi',
    'Outlander',
    2017,
    'JA4AD123456789012',
    521
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (73, 'Lexus', 'RX', 2019, 'JTJBK123456789012', 522);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (74, 'Peugeot', '308', 2016, 'VF3LB123456789012', 523);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (75, 'Citroen', 'C3', 2018, 'VF7SB123456789012', 524);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    76,
    'Skoda',
    'Octavia',
    2015,
    'TMBEG123456789012',
    525
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (77, 'Seat', 'Leon', 2017, 'VSSZZZ12345678901', 526);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (78, 'Volvo', 'XC60', 2019, 'YV1DZ123456789012', 527);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (79, 'Fiat', '500', 2016, 'ZFA31234567890123', 528);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    80,
    'Jeep',
    'Grand Cherokee',
    2018,
    '1C4RJ123456789012',
    529
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    81,
    'Land Rover',
    'Discovery',
    2015,
    'SALRG123456789012',
    530
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (82, 'Suzuki', 'Swift', 2017, 'TSMHT123456789012', 531);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    83,
    'Chevrolet',
    'Cruze',
    2019,
    'KL1NJ123456789012',
    532
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (84, 'Mini', 'Cooper', 2016, 'WMWXU123456789012', 533);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (85, 'Porsche', '911', 2018, 'WP0AB123456789012', 534);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (86, 'Jaguar', 'XF', 2015, 'SAJBD123456789012', 535);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    87,
    'Dacia',
    'Sandero',
    2017,
    'UU1SD123456789012',
    536
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    88,
    'Alfa Romeo',
    'Giulia',
    2019,
    'ZARHA123456789012',
    537
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (89, 'Smart', 'Fortwo', 2016, 'WME45123456789012', 538);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    90,
    'Tesla',
    'Model S',
    2018,
    '5YJSA123456789012',
    539
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    91,
    'Chrysler',
    '300C',
    2015,
    '2C3CC123456789012',
    540
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (92, 'Lada', 'Vesta', 2017, 'XTA12345678901234', 541);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    93,
    'Chevrolet',
    'Corvette',
    1975,
    'FJ4LK3452M36L91M',
    507
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    94,
    'Chevroet',
    'Corvette',
    2004,
    'FJ4LK3452M3345D',
    579
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: carspareparts
# ------------------------------------------------------------

INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (1, 'Spark Plug', 10.99, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (2, 'Oil Filter', 8.99, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (3, 'Brake Pad', 35.99, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (7, 'Бампер передній', 1000.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (8, 'Фара права', 500.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (9, 'Фара ліва', 500.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (10, 'Крило переднє праве', 800.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (11, 'Крило переднє ліве', 800.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (12, 'Дзеркало бічне праве', 300.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (13, 'Дзеркало бічне ліве', 300.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (14, 'Радіатор охолодження', 600.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (15, 'Панель приладів', 400.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (16, 'Рульова рейка', 1200.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (17, 'Амортизатор передній', 400.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (18, 'Амортизатор задній', 400.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (19, 'Стабілізатор передній', 200.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (20, 'Стабілізатор задній', 200.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (21, 'Підшипник передньої ступиці', 250.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (22, 'Підшипник задньої ступиці', 250.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (23, 'Гальма передні', 500.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (24, 'Гальма задні', 500.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (25, 'Тормозні колодки передні', 300.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (26, 'Тормозні колодки задні', 300.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (27, 'Генератор', 800.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (28, 'Стартер', 700.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (29, 'Двигун', 4000.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (30, 'Карбюратор', 600.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (31, 'Свічки запалювання', 50.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (32, 'Фільтр повітряний', 100.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (33, 'Фільтр масляний', 150.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (34, 'Фільтр паливний', 120.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (35, 'Ремінь ГРМ', 200.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (36, 'Ролик натяжний ГРМ', 150.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (37, 'Ролик направляючий ГРМ', 100.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (38, 'Ролик відбору масла', 80.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (39, 'Помпа водяна', 350.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (40, 'Термостат', 100.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (41, 'Радіатор підігріву', 400.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (42, 'Вентилятор охолодження', 200.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (43, 'Підшипник генератора', 80.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (44, 'Підшипник стартера', 100.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (45, 'Сальник колінчастого валу', 150.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (46, 'Сальник клапанної кришки', 80.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (47, 'Сальник коробки передач', 200.00, NULL);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`, `partNumber`)
VALUES
  (48, 'Бампер Toyota Camry', 2000.40, '123455533N234');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: clients
# ------------------------------------------------------------

INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    1,
    'John100%',
    'Doe',
    '123456789',
    'john.doe@example.com',
    '123 Main St'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    37,
    'client',
    'surname',
    '0967719232',
    'somegmail@gmail.com',
    'street'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    507,
    'Іван',
    'Петренко',
    '+380991234567',
    'ivan@example.com',
    'вул. Шевченка, 1'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    508,
    'Олена',
    'Ковальчук',
    '+380992345678',
    'olena@example.com',
    'вул. Шевченка, 2'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    509,
    'Петро',
    'Сидоренко',
    '+380993456789',
    'petro@example.com',
    'вул. Шевченка, 3'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    510,
    'Марія',
    'Коваленко',
    '+380994567890',
    'maria@example.com',
    'вул. Шевченка, 4'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    511,
    'Андрій',
    'Мельник',
    '+380995678901',
    'andriy@example.com',
    'вул. Шевченка, 5'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    512,
    'Оксана',
    'Шевченко',
    '+380996789012',
    'oksana@example.com',
    'вул. Шевченка, 6'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    513,
    'Віктор',
    'Бондаренко',
    '+380997890123',
    'victor@example.com',
    'вул. Шевченка, 7'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    514,
    'Аліна',
    'Панасенко',
    '+380998901234',
    'alina@example.com',
    'вул. Шевченка, 8'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    515,
    'Олег',
    'Іваненко',
    '+380999012345',
    'oleg@example.com',
    'вул. Шевченка, 9'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    516,
    'Наталія',
    'Лисенко',
    '+380981234567',
    'natalia@example.com',
    'вул. Шевченка, 10'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    517,
    'Михайло',
    'Марченко',
    '+380982345678',
    'mikhail@example.com',
    'вул. Шевченка, 11'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    518,
    'Юлія',
    'Білоус',
    '+380983456789',
    'yulia@example.com',
    'вул. Шевченка, 12'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    519,
    'Василь',
    'Ковалев',
    '+380984567890',
    'vasyl@example.com',
    'вул. Шевченка, 13'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    520,
    'Софія',
    'Романенко',
    '+380985678901',
    'sofia@example.com',
    'вул. Шевченка, 14'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    521,
    'Григорій',
    'Захаренко',
    '+380986789012',
    'grigory@example.com',
    'вул. Шевченка, 15'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    522,
    'Ірина',
    'Олексенко',
    '+380987890123',
    'irina@example.com',
    'вул. Шевченка, 16'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    523,
    'Віталій',
    'Пономаренко',
    '+380988901234',
    'vitaliy@example.com',
    'вул. Шевченка, 17'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    524,
    'Дарина',
    'Сергієнко',
    '+380989012345',
    'darina@example.com',
    'вул. Шевченка, 18'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    525,
    'Максим',
    'Ткаченко',
    '+380979012345',
    'maxim@example.com',
    'вул. Шевченка, 19'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    526,
    'Олег',
    'Бровко',
    '+380979123456',
    'oleg1@example.com',
    'вул. Шевченка, 20'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    527,
    'Вікторія',
    'Руденко',
    '+380979234567',
    'victoria@example.com',
    'вул. Шевченка, 21'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    528,
    'Юрій',
    'Жуков',
    '+380979345678',
    'yuriy@example.com',
    'вул. Шевченка, 22'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    529,
    'Ніна',
    'Мельничук',
    '+380979456789',
    'nina@example.com',
    'вул. Шевченка, 23'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    530,
    'Олександр',
    'Григорович',
    '+380979567890',
    'oleksandr@example.com',
    'вул. Шевченка, 24'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    531,
    'Анастасія',
    'Федорова',
    '+380979678901',
    'anastasia@example.com',
    'вул. Шевченка, 25'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    532,
    'Василь',
    'Дмитренко',
    '+380979789012',
    'vasyl1@example.com',
    'вул. Шевченка, 26'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    533,
    'Марина',
    'Борисенко',
    '+380979890123',
    'marina@example.com',
    'вул. Шевченка, 27'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    534,
    'Анатолій',
    'Тарасенко',
    '+380979901234',
    'anatoliy@example.com',
    'вул. Шевченка, 28'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    535,
    'Євгенія',
    'Богданова',
    '+380979052345',
    'evgeniya@example.com',
    'вул. Шевченка, 29'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    536,
    'Дмитро',
    'Романченко',
    '+380979127456',
    'dmitry@example.com',
    'вул. Шевченка, 30'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    537,
    'Ірина',
    'Кравченко',
    '+380979274567',
    'irina1@example.com',
    'вул. Шевченка, 31'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    538,
    'Сергій',
    'Мартиненко',
    '+380979348678',
    'sergey@example.com',
    'вул. Шевченка, 32'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    539,
    'Катерина',
    'Кириченко',
    '+380979456589',
    'katerina@example.com',
    'вул. Шевченка, 33'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    540,
    'Валерій',
    'Андрійчук',
    '+380979563890',
    'valery@example.com',
    'вул. Шевченка, 34'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    541,
    'Анна',
    'Кудрявцева',
    '+380979678931',
    'anna@example.com',
    'вул. Шевченка, 35'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    542,
    'Юрій',
    'Кравчук',
    '+380979789612',
    'yuriy1@example.com',
    'вул. Шевченка, 36'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    543,
    'Надія',
    'Пономаренко',
    '+380979893123',
    'nadiya@example.com',
    'вул. Шевченка, 37'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    544,
    'Роман',
    'Середа',
    '+380979907234',
    'roman@example.com',
    'вул. Шевченка, 38'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    545,
    'Олексій',
    'Литвиненко',
    '+380979012845',
    'oleksiy@example.com',
    'вул. Шевченка, 39'
  );
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `surname`,
    `phoneNumber`,
    `email`,
    `address`
  )
VALUES
  (
    579,
    'TestClient',
    'TestClientSurname',
    '+380967719242',
    'TestClientEmail@gmail.com',
    'Вул. Дружби 16'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orders
# ------------------------------------------------------------

INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    140,
    '2022-12-11',
    'nulla dapibus',
    'Виконано',
    4289.90,
    41,
    19,
    '2022-12-18'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    141,
    '2022-10-24',
    'interdum mauris',
    'Виконано',
    1780.00,
    42,
    27,
    '2022-10-25'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    142,
    '2022-11-27',
    'duis bibendum',
    'Виконано',
    3200.00,
    65,
    27,
    '2022-11-28'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    143,
    '2022-10-08',
    'pede morbi porttitor',
    'Виконано',
    NULL,
    47,
    28,
    '2022-10-13'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    144,
    '2022-10-28',
    'tempus vel pede',
    'Виконано',
    NULL,
    45,
    27,
    '2022-10-31'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    145,
    '2022-12-21',
    'morbi odio',
    'Виконано',
    7220.00,
    88,
    27,
    '2022-12-30'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    146,
    '2022-10-04',
    'sagittis',
    'Виконано',
    10700.00,
    83,
    28,
    '2022-10-07'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    147,
    '2023-04-08',
    'nec',
    'Виконано',
    793.96,
    60,
    19,
    '2023-04-10'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    148,
    '2023-03-02',
    'hac',
    'Виконано',
    2000.00,
    78,
    28,
    '2023-03-10'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    149,
    '2022-06-23',
    'nam',
    'Виконано',
    3600.00,
    94,
    27,
    '2022-06-28'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    150,
    '2023-04-30',
    'odio elementum',
    'Виконано',
    240.00,
    30,
    27,
    '2023-05-10'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    151,
    '2022-10-26',
    'imperdiet et commodo',
    'Виконано',
    4240.00,
    86,
    19,
    '2022-10-30'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    152,
    '2023-02-22',
    'in',
    'Виконано',
    NULL,
    49,
    19,
    '2023-03-01'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    153,
    '2022-09-26',
    'lobortis ligula sit',
    'Виконано',
    500.00,
    86,
    27,
    '2022-10-06'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    154,
    '2023-03-16',
    'lobortis sapien',
    'Виконано',
    12991.60,
    39,
    27,
    '2023-03-19'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    155,
    '2023-04-10',
    'neque duis bibendum',
    'Виконано',
    2100.00,
    94,
    27,
    '2023-04-18'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    156,
    '2022-09-27',
    'velit id pretium',
    'Виконано',
    6360.00,
    32,
    27,
    '2022-09-29'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    157,
    '2022-08-19',
    'volutpat eleifend',
    'Виконано',
    200.00,
    56,
    28,
    '2022-08-28'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    158,
    '2023-01-10',
    'pede posuere',
    'Виконано',
    5150.00,
    39,
    27,
    '2023-01-18'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    159,
    '2022-08-06',
    'arcu',
    'Виконано',
    22900.00,
    31,
    28,
    '2022-08-16'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    160,
    '2023-01-20',
    'cras pellentesque',
    'Виконано',
    2009.90,
    80,
    27,
    '2023-01-29'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    161,
    '2022-06-23',
    'molestie sed justo',
    'Виконано',
    NULL,
    83,
    28,
    '2022-06-27'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    162,
    '2023-01-08',
    'elementum in hac',
    'Виконано',
    800.00,
    34,
    28,
    '2023-01-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    163,
    '2023-04-19',
    'morbi non quam',
    'Виконано',
    300.00,
    73,
    27,
    '2023-04-22'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    164,
    '2023-01-30',
    'mattis nibh ligula',
    'Виконано',
    5800.00,
    64,
    27,
    '2023-02-03'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    165,
    '2023-06-06',
    'gravida',
    'Виконано',
    1200.00,
    83,
    19,
    '2023-06-12'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    166,
    '2022-09-21',
    'potenti',
    'Виконано',
    1600.00,
    24,
    19,
    '2022-09-27'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    167,
    '2022-06-23',
    'nulla ac',
    'Виконано',
    NULL,
    47,
    19,
    '2022-07-03'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    168,
    '2022-07-01',
    'ut ultrices vel',
    'Виконано',
    5600.00,
    56,
    27,
    '2022-07-06'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    169,
    '2022-10-06',
    'semper porta volutpat',
    'Виконано',
    5820.00,
    43,
    19,
    '2022-10-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    170,
    '2022-12-22',
    'pharetra',
    'Виконано',
    4090.00,
    51,
    28,
    '2022-12-24'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    171,
    '2023-02-10',
    'nulla tempus',
    'Виконано',
    7500.00,
    42,
    27,
    '2023-02-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    172,
    '2022-12-14',
    'in',
    'Виконано',
    2000.00,
    77,
    27,
    '2022-12-17'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    173,
    '2022-06-11',
    'condimentum neque sapien',
    'Виконано',
    4050.00,
    57,
    28,
    '2022-06-17'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    174,
    '2022-08-17',
    'sed',
    'Виконано',
    5600.00,
    27,
    27,
    '2022-08-20'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    175,
    '2022-06-22',
    'proin eu mi',
    'Виконано',
    6000.00,
    82,
    28,
    '2022-06-29'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    176,
    '2022-11-15',
    'iaculis',
    'Виконано',
    1000.00,
    75,
    27,
    '2022-11-23'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    177,
    '2023-05-09',
    'convallis nulla neque',
    'Виконано',
    10002.00,
    85,
    28,
    '2023-05-17'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    178,
    '2022-10-03',
    'cum sociis natoque',
    'Виконано',
    6961.98,
    35,
    19,
    '2022-10-12'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    179,
    '2022-10-06',
    'nisl aenean',
    'Виконано',
    NULL,
    82,
    27,
    '2022-10-10'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    180,
    '2022-09-27',
    'in',
    'Виконано',
    8001.60,
    50,
    28,
    '2022-10-06'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    181,
    '2023-04-20',
    'nisl nunc',
    'Виконано',
    1440.00,
    64,
    27,
    '2023-04-21'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    182,
    '2023-03-10',
    'justo',
    'Виконано',
    12000.00,
    50,
    27,
    '2023-03-11'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    183,
    '2022-10-02',
    'suspendisse potenti nullam',
    'Виконано',
    NULL,
    47,
    19,
    '2022-10-12'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    184,
    '2022-11-05',
    'donec',
    'Виконано',
    544.95,
    47,
    19,
    '2022-11-13'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    185,
    '2023-05-23',
    'non mi',
    'Виконано',
    7800.00,
    63,
    27,
    '2023-06-01'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    186,
    '2022-10-01',
    'vel pede',
    'Виконано',
    1307.97,
    76,
    28,
    '2022-10-09'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    187,
    '2023-05-31',
    'pede venenatis',
    'Виконано',
    NULL,
    29,
    27,
    '2023-06-05'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    188,
    '2022-10-04',
    'maecenas pulvinar',
    'Виконано',
    NULL,
    61,
    28,
    '2022-10-13'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    189,
    '2023-03-12',
    'nulla ultrices aliquet',
    'Виконано',
    5300.00,
    37,
    27,
    '2023-03-15'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    190,
    '2022-06-26',
    'quis turpis sed',
    'Виконано',
    48000.00,
    34,
    19,
    '2022-06-30'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    191,
    '2022-08-11',
    'duis',
    'Виконано',
    2720.00,
    69,
    19,
    '2022-08-12'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    192,
    '2023-03-04',
    'integer',
    'Виконано',
    4900.00,
    41,
    28,
    '2023-03-05'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    193,
    '2022-10-14',
    'nulla',
    'Виконано',
    46450.00,
    41,
    28,
    '2022-10-17'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    194,
    '2023-06-08',
    'vulputate luctus',
    'Виконано',
    300.00,
    65,
    28,
    '2023-06-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    195,
    '2022-06-29',
    'libero nam',
    'Виконано',
    1050.00,
    72,
    19,
    '2022-07-01'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    196,
    '2022-10-09',
    'eget',
    'Виконано',
    8400.00,
    76,
    27,
    '2022-10-18'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    197,
    '2022-08-12',
    'cum',
    'Виконано',
    1287.92,
    74,
    28,
    '2022-08-13'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    198,
    '2022-09-21',
    'nullam varius nulla',
    'Виконано',
    NULL,
    37,
    28,
    '2022-10-01'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    199,
    '2022-06-21',
    'morbi ut odio',
    'Виконано',
    560.00,
    87,
    19,
    '2022-06-30'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    200,
    '2022-08-05',
    'vehicula',
    'Виконано',
    4400.00,
    41,
    28,
    '2022-08-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    201,
    '2023-01-08',
    'donec quis',
    'Виконано',
    5600.00,
    55,
    28,
    '2023-01-18'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    202,
    '2022-07-19',
    'odio',
    'Виконано',
    NULL,
    38,
    27,
    '2022-07-27'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    203,
    '2023-01-04',
    'vel',
    'Виконано',
    200.00,
    30,
    27,
    '2023-01-07'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    204,
    '2022-11-04',
    'porttitor id',
    'Виконано',
    2500.00,
    64,
    28,
    '2022-11-06'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    205,
    '2023-05-11',
    'pulvinar',
    'Виконано',
    1600.00,
    93,
    19,
    '2023-05-17'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    206,
    '2023-04-08',
    'posuere cubilia curae',
    'Виконано',
    6100.00,
    62,
    27,
    '2023-04-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    207,
    '2022-07-29',
    'imperdiet',
    'Виконано',
    4100.00,
    89,
    27,
    '2022-08-06'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    208,
    '2022-10-20',
    'magna ac',
    'Виконано',
    100.00,
    74,
    27,
    '2022-10-21'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    209,
    '2022-08-11',
    'suscipit nulla',
    'Виконано',
    2900.00,
    31,
    27,
    '2022-08-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    210,
    '2022-10-27',
    'ut massa quis',
    'Виконано',
    5600.00,
    92,
    27,
    '2022-10-30'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    211,
    '2022-08-28',
    'odio',
    'Виконано',
    9601.60,
    74,
    19,
    '2022-09-04'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    212,
    '2022-10-08',
    'vel pede',
    'Виконано',
    28850.00,
    34,
    19,
    '2022-10-11'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    213,
    '2022-07-10',
    'sed',
    'Виконано',
    7480.91,
    46,
    27,
    '2022-07-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    214,
    '2023-05-03',
    'platea dictumst',
    'Виконано',
    3500.00,
    70,
    28,
    '2023-05-07'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    215,
    '2023-03-22',
    'mus etiam',
    'Виконано',
    2300.00,
    70,
    19,
    '2023-03-27'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    216,
    '2022-11-16',
    'mattis',
    'Виконано',
    1507.97,
    28,
    19,
    '2022-11-26'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    217,
    '2023-05-29',
    'justo etiam pretium',
    'Виконано',
    2400.00,
    74,
    28,
    '2023-06-04'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    218,
    '2023-05-07',
    'erat tortor',
    'Виконано',
    2100.00,
    69,
    28,
    '2023-05-11'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    219,
    '2022-09-13',
    'amet',
    'Виконано',
    1500.00,
    35,
    28,
    '2022-09-22'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    220,
    '2023-03-11',
    'suspendisse accumsan tortor',
    'Виконано',
    3260.00,
    53,
    19,
    '2023-03-13'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    221,
    '2023-03-07',
    'sem praesent id',
    'Виконано',
    2000.00,
    43,
    27,
    '2023-03-09'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    222,
    '2023-02-04',
    'eros suspendisse',
    'Виконано',
    5700.00,
    34,
    28,
    '2023-02-07'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    223,
    '2023-01-30',
    'sit amet lobortis',
    'Виконано',
    7109.90,
    33,
    28,
    '2023-02-05'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    224,
    '2022-08-11',
    'mollis molestie lorem',
    'Виконано',
    3643.96,
    37,
    28,
    '2022-08-15'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    225,
    '2023-02-13',
    'nullam sit',
    'Виконано',
    7700.00,
    50,
    28,
    '2023-02-15'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    226,
    '2022-09-15',
    'diam in magna',
    'Виконано',
    4600.00,
    32,
    19,
    '2022-09-19'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    227,
    '2023-02-21',
    'semper rutrum nulla',
    'Виконано',
    NULL,
    77,
    19,
    '2023-03-01'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    228,
    '2022-07-23',
    'ligula',
    'Виконано',
    2293.94,
    64,
    28,
    '2022-07-24'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    229,
    '2022-10-08',
    'tincidunt in leo',
    'Виконано',
    808.99,
    82,
    19,
    '2022-10-12'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    230,
    '2022-06-14',
    'vulputate',
    'Виконано',
    NULL,
    79,
    19,
    '2022-06-22'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    231,
    '2022-07-28',
    'morbi',
    'Виконано',
    23920.00,
    29,
    19,
    '2022-08-04'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    232,
    '2023-05-10',
    'nisi',
    'Виконано',
    1000.00,
    56,
    28,
    '2023-05-16'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    233,
    '2022-11-27',
    'in imperdiet',
    'Виконано',
    4880.00,
    45,
    19,
    '2022-12-02'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    234,
    '2022-12-03',
    'nulla eget',
    'Виконано',
    3600.00,
    93,
    28,
    '2022-12-05'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    235,
    '2023-02-19',
    'aliquam sit',
    'Виконано',
    1600.00,
    31,
    19,
    '2023-02-28'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    236,
    '2023-01-03',
    'ipsum integer',
    'Виконано',
    10960.00,
    59,
    27,
    '2023-01-12'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    237,
    '2023-03-22',
    'urna ut',
    'Виконано',
    2600.00,
    24,
    27,
    '2023-03-30'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    238,
    '2023-05-06',
    'curae donec',
    'Виконано',
    1510.00,
    81,
    27,
    '2023-05-14'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    239,
    '2023-02-28',
    'eget',
    'Виконано',
    2100.00,
    83,
    19,
    '2023-03-09'
  );
INSERT INTO
  `orders` (
    `id`,
    `orderDate`,
    `description`,
    `status`,
    `cost`,
    `carId`,
    `workerId`,
    `issueDate`
  )
VALUES
  (
    240,
    '2023-06-16',
    'eget',
    'Виконано',
    NULL,
    83,
    27,
    '2023-06-18'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orderspareparts
# ------------------------------------------------------------

INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (35, 209, 22, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (36, 211, 48, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (37, 186, 3, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (38, 211, 48, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (39, 156, 28, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (40, 156, 38, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (41, 160, 40, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (42, 238, 45, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (43, 155, 20, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (44, 173, 36, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (45, 237, 17, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (46, 200, 15, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (47, 157, 44, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (48, 189, 40, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (49, 145, 43, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (50, 190, 27, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (51, 204, 39, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (52, 160, 46, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (53, 142, 20, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (54, 170, 34, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (55, 213, 14, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (56, 197, 1, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (57, 234, 9, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (58, 141, 22, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (59, 226, 33, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (60, 200, 20, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (63, 192, 8, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (64, 181, 19, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (65, 236, 8, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (66, 224, 28, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (67, 212, 29, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (68, 193, 33, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (69, 172, 18, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (70, 163, 12, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (71, 207, 19, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (72, 159, 8, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (73, 199, 43, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (74, 142, 47, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (75, 145, 28, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (76, 200, 7, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (77, 170, 28, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (78, 206, 9, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (79, 232, 32, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (80, 191, 46, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (81, 239, 26, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (82, 178, 1, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (83, 165, 15, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (84, 212, 39, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (85, 140, 2, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (86, 219, 8, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (87, 147, 31, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (88, 229, 32, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (89, 175, 42, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (90, 192, 47, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (91, 176, 9, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (92, 213, 2, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (93, 158, 15, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (94, 156, 45, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (95, 223, 1, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (96, 185, 41, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (97, 156, 22, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (98, 148, 45, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (99, 156, 25, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (100, 228, 2, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (101, 159, 28, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (102, 164, 27, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (103, 189, 14, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (104, 220, 43, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (105, 184, 40, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (106, 170, 22, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (107, 182, 8, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (108, 151, 43, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (109, 151, 22, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (110, 171, 8, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (111, 216, 33, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (112, 149, 17, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (113, 222, 39, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (114, 175, 35, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (115, 238, 44, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (116, 216, 3, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (117, 193, 21, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (118, 206, 11, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (119, 153, 32, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (120, 213, 35, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (121, 184, 2, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (122, 154, 43, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (123, 238, 34, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (124, 158, 28, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (125, 225, 10, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (126, 173, 20, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (127, 171, 23, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (128, 226, 29, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (129, 236, 38, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (130, 140, 28, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (131, 233, 27, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (132, 141, 11, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (133, 190, 29, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (134, 228, 20, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (135, 180, 48, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (136, 196, 27, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (137, 182, 29, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (138, 233, 19, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (139, 178, 40, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (140, 173, 14, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (141, 207, 8, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (142, 196, 13, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (143, 170, 42, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (144, 237, 40, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (145, 217, 15, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (146, 236, 39, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (147, 168, 15, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (148, 177, 48, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (149, 212, 31, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (150, 155, 44, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (151, 215, 15, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (152, 201, 47, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (153, 175, 35, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (154, 162, 47, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (155, 158, 22, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (156, 169, 31, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (157, 164, 37, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (158, 208, 32, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (159, 195, 45, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (160, 186, 34, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (161, 150, 34, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (162, 193, 16, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (163, 146, 28, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (164, 169, 8, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (165, 234, 32, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (166, 201, 12, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (167, 200, 35, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (168, 160, 25, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (169, 169, 38, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (170, 213, 41, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (171, 160, 1, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (172, 221, 42, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (173, 210, 10, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (174, 228, 43, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (175, 236, 13, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (176, 196, 18, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (177, 209, 31, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (178, 218, 12, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (179, 166, 17, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (180, 148, 28, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (181, 231, 34, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (182, 225, 33, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (183, 191, 35, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (184, 193, 32, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (185, 169, 33, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (186, 194, 45, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (187, 159, 16, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (188, 160, 15, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (189, 220, 25, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (190, 151, 11, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (191, 149, 18, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (192, 212, 21, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (193, 181, 46, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (194, 213, 37, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (195, 141, 43, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (196, 154, 22, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (197, 154, 48, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (198, 222, 10, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (199, 231, 29, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (200, 168, 24, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (201, 203, 37, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (202, 225, 7, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (203, 233, 43, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (204, 205, 27, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (205, 193, 29, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (206, 141, 38, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (207, 185, 30, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (208, 214, 9, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (209, 147, 1, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (210, 147, 40, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (211, 145, 12, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (212, 224, 3, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (213, 174, 27, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (214, 146, 16, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (215, 215, 9, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (216, 178, 10, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (217, 191, 40, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (218, 216, 40, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (219, 231, 10, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (220, 210, 18, 10);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (221, 211, 27, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (222, 235, 11, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (223, 201, 28, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (224, 229, 2, 1);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (225, 236, 12, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (226, 175, 41, 6);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (227, 212, 32, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (228, 146, 41, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (229, 159, 19, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (230, 178, 46, 8);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (231, 223, 7, 7);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (232, 154, 21, 9);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (233, 216, 19, 5);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (234, 204, 30, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (235, 197, 30, 2);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (236, 159, 15, 3);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (237, 222, 44, 4);
INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (238, 237, 19, 3);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: roles
# ------------------------------------------------------------

INSERT INTO
  `roles` (`id`, `role`)
VALUES
  (4, 'Адміністратор');
INSERT INTO
  `roles` (`id`, `role`)
VALUES
  (5, 'Менеджер');
INSERT INTO
  `roles` (`id`, `role`)
VALUES
  (6, 'Механік');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: workers
# ------------------------------------------------------------

INSERT INTO
  `workers` (
    `id`,
    `name`,
    `surname`,
    `login`,
    `password`,
    `roleId`
  )
VALUES
  (
    19,
    'Анатолій',
    'Анатолійович',
    'Tolyan3211',
    '$2b$08$IkOGVCvZ7SKP27aqrXh8Wet47M.E7.UYoXPLmFEe38v7SUBgsNE7W',
    6
  );
INSERT INTO
  `workers` (
    `id`,
    `name`,
    `surname`,
    `login`,
    `password`,
    `roleId`
  )
VALUES
  (
    20,
    'Ярослав',
    'Озорнін',
    'Ozzy',
    '$2b$08$nDgAmetkju30mm8c.6.d/ekfpofCsoUE8/umECRJfd/Gx5sLcKdQm',
    4
  );
INSERT INTO
  `workers` (
    `id`,
    `name`,
    `surname`,
    `login`,
    `password`,
    `roleId`
  )
VALUES
  (
    25,
    'Tolyan',
    'Tolya',
    'manager',
    '$2b$08$J/bdFtdaex5AYXhQl.b2hujXweIid3HWhjrHMqfbTh4o/uc9h/aRO',
    5
  );
INSERT INTO
  `workers` (
    `id`,
    `name`,
    `surname`,
    `login`,
    `password`,
    `roleId`
  )
VALUES
  (
    27,
    'TheWorstMechanic',
    'Mechanic',
    'TheWorstMechanic',
    '$2b$08$x7JVROQzlbONj/uvmFjSQ.d2683YLuxMmjB5iw6pSKPhVboZqaG/y',
    6
  );
INSERT INTO
  `workers` (
    `id`,
    `name`,
    `surname`,
    `login`,
    `password`,
    `roleId`
  )
VALUES
  (
    28,
    'TheBesttMechanic',
    'Mechanic',
    'TheBesttMechanic',
    '$2b$08$8WOVMUjYm3UOBZRlHyr4HO/OE5qOEYGHPFkjwG9b4GPsR43TmjLdK',
    6
  );

# ------------------------------------------------------------
# TRIGGER DUMP FOR: prevent_duplicate_order
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS prevent_duplicate_order;
DELIMITER ;;
CREATE TRIGGER `prevent_duplicate_order` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    DECLARE existing_order INT;
    SELECT COUNT(*) INTO existing_order FROM orders WHERE carId = NEW.carId AND status != 'Виконано';
    IF existing_order > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This car is already on repair';
    END IF;
END;;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: assign_mechanic_on_insert
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS assign_mechanic_on_insert;
DELIMITER ;;
CREATE TRIGGER `assign_mechanic_on_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    DECLARE mechanic_id INT;
    
    SET mechanic_id = (
        SELECT id FROM (
            SELECT W.id, COUNT(O.id) AS orderCount
            FROM workers W
            LEFT JOIN orders O ON W.id = O.workerId AND O.status != 'Виконано'
            where W.roleId = 6
            GROUP BY W.id
            ORDER BY orderCount ASC
        ) AS mechanic_orders
        WHERE orderCount < 3
        LIMIT 1
    );
    
    IF mechanic_id IS NULL THEN
        SET NEW.status = 'Очікує';
        SET NEW.workerId = NULL;
    ELSE
        SET NEW.status = 'Виконується';
        SET NEW.workerId = mechanic_id;
    END IF;
END;;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: check_mechanic_role_update
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS check_mechanic_role_update;
DELIMITER ;;
CREATE TRIGGER `check_mechanic_role_update` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
    DECLARE userRoleId INT;

    SELECT w.roleId INTO userRoleId FROM workers w WHERE w.id = new.workerId;
    if (select r.role from courseworkdb.roles r where r.id = userRoleId) <> 'Механік' then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Працівник повинен бути Механіком!';
	end if;

END;;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: update_order_price_insert
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS update_order_price_insert;
DELIMITER ;;
CREATE TRIGGER `update_order_price_insert` AFTER INSERT ON `orderspareparts` FOR EACH ROW BEGIN
    CALL update_order_price_proc(NEW.orderId);
END;;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: update_order_price_update
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS update_order_price_update;
DELIMITER ;;
CREATE TRIGGER `update_order_price_update` AFTER UPDATE ON `orderspareparts` FOR EACH ROW BEGIN
    CALL update_order_price_proc(NEW.orderId);
END;;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: update_order_price_delete
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS update_order_price_delete;
DELIMITER ;;
CREATE TRIGGER `update_order_price_delete` AFTER DELETE ON `orderspareparts` FOR EACH ROW BEGIN
    CALL update_order_price_proc(OLD.orderId);
END;;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: DeleteWorkerTrigger
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS DeleteWorkerTrigger;
DELIMITER ;;
CREATE TRIGGER `DeleteWorkerTrigger` AFTER DELETE ON `workers` FOR EACH ROW BEGIN
  UPDATE orders
  SET workerId = NULL
  WHERE workerId = OLD.id;
END;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
