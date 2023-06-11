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
) ENGINE = InnoDB AUTO_INCREMENT = 93 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: carspareparts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `carspareparts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 48 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 576 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cars
# ------------------------------------------------------------

INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (23, 'BMW', 'X5', 2018, 'WBAKL7C59J0T12345', 507);
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

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: carspareparts
# ------------------------------------------------------------

INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (1, 'Spark Plug', 10.99);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (2, 'Oil Filter', 8.99);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (3, 'Brake Pad', 35.99);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (7, 'Бампер передній', 1000.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (8, 'Фара права', 500.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (9, 'Фара ліва', 500.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (10, 'Крило переднє праве', 800.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (11, 'Крило переднє ліве', 800.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (12, 'Дзеркало бічне праве', 300.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (13, 'Дзеркало бічне ліве', 300.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (14, 'Радіатор охолодження', 600.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (15, 'Панель приладів', 400.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (16, 'Рульова рейка', 1200.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (17, 'Амортизатор передній', 400.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (18, 'Амортизатор задній', 400.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (19, 'Стабілізатор передній', 200.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (20, 'Стабілізатор задній', 200.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (21, 'Підшипник передньої ступиці', 250.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (22, 'Підшипник задньої ступиці', 250.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (23, 'Гальма передні', 500.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (24, 'Гальма задні', 500.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (25, 'Тормозні колодки передні', 300.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (26, 'Тормозні колодки задні', 300.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (27, 'Генератор', 800.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (28, 'Стартер', 700.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (29, 'Двигун', 4000.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (30, 'Карбюратор', 600.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (31, 'Свічки запалювання', 50.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (32, 'Фільтр повітряний', 100.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (33, 'Фільтр масляний', 150.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (34, 'Фільтр паливний', 120.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (35, 'Ремінь ГРМ', 200.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (36, 'Ролик натяжний ГРМ', 150.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (37, 'Ролик направляючий ГРМ', 100.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (38, 'Ролик відбору масла', 80.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (39, 'Помпа водяна', 350.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (40, 'Термостат', 100.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (41, 'Радіатор підігріву', 400.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (42, 'Вентилятор охолодження', 200.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (43, 'Підшипник генератора', 80.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (44, 'Підшипник стартера', 100.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (45, 'Сальник колінчастого валу', 150.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (46, 'Сальник клапанної кришки', 80.00);
INSERT INTO
  `carspareparts` (`id`, `name`, `price`)
VALUES
  (47, 'Сальник коробки передач', 200.00);

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

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orders
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orderspareparts
# ------------------------------------------------------------


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
