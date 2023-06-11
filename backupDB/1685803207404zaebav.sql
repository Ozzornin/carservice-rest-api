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
  KEY `clientId` (`clientId`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: carspareparts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `carspareparts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
  KEY `carId` (`carId`),
  KEY `workerId` (`workerId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `cars` (`id`),
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
  KEY `orderId` (`orderId`),
  KEY `partId` (`partId`),
  CONSTRAINT `orderspareparts_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
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
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cars
# ------------------------------------------------------------

INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (1, 'Toyota', 'Camry', 2020, 'ABC123', 1);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (2, 'Honda', 'Civic', 2019, 'DEF456', 2);
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    17,
    'Honda122',
    'Accord33',
    2020,
    'qwertyuiopasdfgh1',
    36
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    19,
    'Honda122',
    'Accord33',
    2020,
    'qwertyuiopasdfgh2',
    36
  );
INSERT INTO
  `cars` (`id`, `brand`, `model`, `year`, `vin`, `clientId`)
VALUES
  (
    20,
    'Honda122',
    'Accord33',
    2030,
    'qwertyuiopasdfg11',
    36
  );

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
    'John',
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
    2,
    'Jane',
    'Smith',
    '987654321',
    'jane.smith@example.com',
    '456 Elm St'
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
    36,
    'yaroslav111',
    'ozornin',
    '0967719242',
    'y.ozornin.333@gmail.com',
    'some street in nowhere'
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
    2,
    '2023-06-02',
    'Routine Maintenance',
    'Виконано',
    35.96,
    1,
    8,
    '2023-06-02'
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
    3,
    '2023-06-02',
    'Brake Repair',
    'Очікує',
    0.00,
    2,
    NULL,
    NULL
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
    4,
    '2023-06-02',
    'Routine Maintenance',
    'Виконано',
    0.00,
    1,
    8,
    '2023-06-02'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orderspareparts
# ------------------------------------------------------------

INSERT INTO
  `orderspareparts` (`id`, `orderId`, `partId`, `amount`)
VALUES
  (6, 2, 2, 4);

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
  (6, 'Admin', 'Adminson', 'admin', 'admin123', 4);
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
  (7, 'Manager', 'Smith', 'manager', 'user123', 5);
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
  (8, 'Mechanic', 'Mech', 'mechanic', '2134', 6);
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
