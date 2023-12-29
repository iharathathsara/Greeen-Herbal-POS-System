-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.27 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping database structure for green_herbal
CREATE DATABASE IF NOT EXISTS `green_herbal` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `green_herbal`;

-- Dumping structure for table green_herbal.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.brand: ~0 rows (approximately)
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`id`, `name`) VALUES
	(1, 'Coconut Oil'),
	(2, 'Siddalepa'),
	(3, 'Wijaya');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table green_herbal.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.category: ~0 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'oil'),
	(2, 'barm'),
	(3, 'Spices');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table green_herbal.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.city: ~3 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Galle'),
	(2, 'Colombo'),
	(3, 'Mathara'),
	(4, 'Gampaha');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table green_herbal.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.company: ~2 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`, `name`, `contact_number`) VALUES
	(1, 'Ruviru', '0916537526'),
	(4, 'XploCinemon', '0912289473'),
	(5, 'PDio', '0917464737'),
	(6, 'Wijaya', '0917364673');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table green_herbal.company_branch
CREATE TABLE IF NOT EXISTS `company_branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `branch_contact_number` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `company_branch_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_branch_company1_idx` (`company_id`),
  KEY `fk_company_branch_company_branch_address1_idx` (`company_branch_address_id`),
  CONSTRAINT `fk_company_branch_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_company_branch_company_branch_address1` FOREIGN KEY (`company_branch_address_id`) REFERENCES `company_branch_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.company_branch: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_branch` DISABLE KEYS */;
INSERT INTO `company_branch` (`id`, `company_id`, `branch_contact_number`, `name`, `company_branch_address_id`) VALUES
	(1, 1, '0916537526', 'RuviruG', 1),
	(2, 4, '0913673746', 'Xplo Galle', 2),
	(3, 5, '0916464737', 'pdio galle', 3),
	(4, 6, '0918374647', 'Wijaya galle', 4);
/*!40000 ALTER TABLE `company_branch` ENABLE KEYS */;

-- Dumping structure for table green_herbal.company_branch_address
CREATE TABLE IF NOT EXISTS `company_branch_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` text NOT NULL,
  `line2` text NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_supplier_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.company_branch_address: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_branch_address` DISABLE KEYS */;
INSERT INTO `company_branch_address` (`id`, `line1`, `line2`, `city_id`) VALUES
	(1, 'Nugaduwa', 'Dewata', 1),
	(2, 'Wawlugala', 'Kananke', 1),
	(3, 'nugaduwa', 'kaduruduwa', 1),
	(4, 'No,20', 'Pettigala Watta', 1);
/*!40000 ALTER TABLE `company_branch_address` ENABLE KEYS */;

-- Dumping structure for table green_herbal.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_city1_idx` (`city_id`),
  CONSTRAINT `fk_customer_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.customer: ~3 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`, `name`, `contact_number`, `city_id`) VALUES
	(0, 'Null', 'Null', 1),
	(1, 'Pawan', '0773647363', 3),
	(2, 'Kushan', '0716374736', 1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table green_herbal.emp_attendce
CREATE TABLE IF NOT EXISTS `emp_attendce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `att_date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__user` (`emp_id`),
  CONSTRAINT `FK__user` FOREIGN KEY (`emp_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.emp_attendce: ~4 rows (approximately)
/*!40000 ALTER TABLE `emp_attendce` DISABLE KEYS */;
INSERT INTO `emp_attendce` (`id`, `emp_id`, `att_date`, `time_from`, `time_to`) VALUES
	(1, 2, '2022-07-20', '19:57:22', '20:54:20'),
	(2, 3, '2022-07-20', '20:06:20', '20:54:39'),
	(3, 2, '2022-07-21', '12:20:15', '12:20:38'),
	(4, 3, '2022-07-21', '12:20:30', '00:05:09');
/*!40000 ALTER TABLE `emp_attendce` ENABLE KEYS */;

-- Dumping structure for table green_herbal.emp_payment
CREATE TABLE IF NOT EXISTS `emp_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `pay_date` date NOT NULL,
  `month_id` int NOT NULL,
  `payment` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_payment_user` (`emp_id`),
  KEY `FK_emp_payment_month` (`month_id`),
  CONSTRAINT `FK_emp_payment_month` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`),
  CONSTRAINT `FK_emp_payment_user` FOREIGN KEY (`emp_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.emp_payment: ~9 rows (approximately)
/*!40000 ALTER TABLE `emp_payment` DISABLE KEYS */;
INSERT INTO `emp_payment` (`id`, `emp_id`, `pay_date`, `month_id`, `payment`) VALUES
	(1, 2, '2022-07-21', 1, 1000),
	(4, 2, '2022-07-26', 2, 30000),
	(5, 3, '2022-07-27', 6, 30000),
	(6, 2, '2022-07-27', 3, 30000),
	(7, 4, '2022-07-29', 6, 20000),
	(8, 2, '2022-07-29', 4, 30000),
	(9, 2, '2022-07-30', 8, 30000),
	(10, 2, '2022-07-30', 9, 30000),
	(11, 3, '2022-08-01', 7, 30000);
/*!40000 ALTER TABLE `emp_payment` ENABLE KEYS */;

-- Dumping structure for table green_herbal.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `unique_id` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_supplier1_idx` (`supplier_id`),
  KEY `fk_grn_user1_idx` (`user_id`),
  CONSTRAINT `fk_grn_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_grn_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.grn: ~2 rows (approximately)
/*!40000 ALTER TABLE `grn` DISABLE KEYS */;
INSERT INTO `grn` (`id`, `supplier_id`, `date_time`, `user_id`, `unique_id`) VALUES
	(19, 4, '2022-07-29 20:23:39', 1, '1659106419995-1'),
	(20, 1, '2022-07-29 20:27:13', 1, '1659106633578-1'),
	(21, 2, '2022-07-29 20:29:48', 1, '1659106788668-1');
/*!40000 ALTER TABLE `grn` ENABLE KEYS */;

-- Dumping structure for table green_herbal.grn_item
CREATE TABLE IF NOT EXISTS `grn_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `buying_price` double NOT NULL,
  `grn_id` int NOT NULL,
  `stock_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_item_grn1_idx` (`grn_id`),
  KEY `fk_grn_item_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_grn_item_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.grn_item: ~6 rows (approximately)
/*!40000 ALTER TABLE `grn_item` DISABLE KEYS */;
INSERT INTO `grn_item` (`id`, `quantity`, `buying_price`, `grn_id`, `stock_id`) VALUES
	(22, 10, 100, 19, 20),
	(23, 10, 100, 19, 21),
	(24, 6, 500, 20, 22),
	(25, 6, 300, 20, 23),
	(26, 5, 60, 21, 24),
	(27, 5, 120, 21, 25);
/*!40000 ALTER TABLE `grn_item` ENABLE KEYS */;

-- Dumping structure for table green_herbal.grn_payment
CREATE TABLE IF NOT EXISTS `grn_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grn_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `payment` double NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_payment_grn1_idx` (`grn_id`),
  KEY `fk_grn_payment_payment_type1_idx` (`payment_type_id`),
  CONSTRAINT `fk_grn_payment_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_payment_payment_type1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.grn_payment: ~2 rows (approximately)
/*!40000 ALTER TABLE `grn_payment` DISABLE KEYS */;
INSERT INTO `grn_payment` (`id`, `grn_id`, `payment_type_id`, `payment`, `balance`) VALUES
	(16, 19, 1, 2000, 0),
	(17, 20, 1, 5000, 200),
	(18, 21, 1, 1000, 100);
/*!40000 ALTER TABLE `grn_payment` ENABLE KEYS */;

-- Dumping structure for table green_herbal.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `unique_id` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_customer1_idx` (`customer_id`),
  KEY `fk_invoice_user1_idx` (`user_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.invoice: ~0 rows (approximately)
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`id`, `customer_id`, `date_time`, `user_id`, `unique_id`) VALUES
	(11, 0, '2022-07-29 20:32:42', 1, '1659106962520-1');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;

-- Dumping structure for table green_herbal.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `stock_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_item_stock1_idx` (`stock_id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.invoice_item: ~2 rows (approximately)
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;
INSERT INTO `invoice_item` (`id`, `qty`, `stock_id`, `invoice_id`) VALUES
	(10, 1, 20, 11),
	(11, 1, 21, 11),
	(12, 2, 24, 11);
/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;

-- Dumping structure for table green_herbal.invoice_payment
CREATE TABLE IF NOT EXISTS `invoice_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `payment` double NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_payment_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_payment_payment_type1_idx` (`payment_type_id`),
  CONSTRAINT `fk_invoice_payment_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_payment_payment_type1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.invoice_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `invoice_payment` DISABLE KEYS */;
INSERT INTO `invoice_payment` (`id`, `invoice_id`, `payment_type_id`, `payment`, `balance`) VALUES
	(9, 11, 1, 420, 0);
/*!40000 ALTER TABLE `invoice_payment` ENABLE KEYS */;

-- Dumping structure for table green_herbal.month
CREATE TABLE IF NOT EXISTS `month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.month: ~11 rows (approximately)
/*!40000 ALTER TABLE `month` DISABLE KEYS */;
INSERT INTO `month` (`id`, `name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August'),
	(9, 'September'),
	(10, 'Octomber'),
	(11, 'November'),
	(12, 'December');
/*!40000 ALTER TABLE `month` ENABLE KEYS */;

-- Dumping structure for table green_herbal.month_payment
CREATE TABLE IF NOT EXISTS `month_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_type_id` int NOT NULL,
  `month_pay` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__user_type` (`user_type_id`),
  CONSTRAINT `FK__user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.month_payment: ~2 rows (approximately)
/*!40000 ALTER TABLE `month_payment` DISABLE KEYS */;
INSERT INTO `month_payment` (`id`, `user_type_id`, `month_pay`) VALUES
	(1, 2, 30000),
	(2, 3, 20000),
	(3, 6, 10000);
/*!40000 ALTER TABLE `month_payment` ENABLE KEYS */;

-- Dumping structure for table green_herbal.payment_type
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.payment_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` (`id`, `name`) VALUES
	(1, 'Cash'),
	(2, 'Card'),
	(3, 'Check'),
	(4, 'Credits');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;

-- Dumping structure for table green_herbal.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category1_idx` (`category_id`),
  KEY `fk_product_brand1_idx` (`brand_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.product: ~7 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `category_id`, `brand_id`, `name`) VALUES
	(1, 1, 1, 'Ruviru Coconut Oil 1l bottle'),
	(2, 2, 2, 'Siddalepa 50g'),
	(3, 2, 2, 'Siddlepa 150g'),
	(4, 1, 1, 'Ruvuru Coconut Oil 500ml'),
	(5, 3, 3, 'Chili Powder 50g'),
	(6, 3, 3, 'Chili Powder 100g'),
	(7, 3, 3, 'Pepper Powder 50g'),
	(8, 3, 3, 'Pepper Powder 100g');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table green_herbal.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `selling_price` double NOT NULL,
  `mfd` date NOT NULL,
  `exd` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_product1_idx` (`product_id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.stock: ~6 rows (approximately)
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`id`, `product_id`, `quantity`, `selling_price`, `mfd`, `exd`) VALUES
	(20, 5, 9, 130, '2022-07-03', '2023-07-03'),
	(21, 7, 9, 130, '2022-07-03', '2023-07-03'),
	(22, 1, 6, 550, '2022-07-08', '2023-07-08'),
	(23, 4, 6, 350, '2022-07-08', '2023-07-08'),
	(24, 2, 3, 80, '2021-07-31', '2022-07-31'),
	(25, 3, 5, 150, '2021-08-10', '2022-08-10');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Dumping structure for table green_herbal.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `company_branch_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_company_branch1_idx` (`company_branch_id`),
  CONSTRAINT `fk_supplier_company_branch1` FOREIGN KEY (`company_branch_id`) REFERENCES `company_branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.supplier: ~2 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id`, `name`, `contact_number`, `email`, `company_branch_id`) VALUES
	(1, 'Tharidu', '0779880794', 'tharindu@gmail.com', 1),
	(2, 'Kavidu', '0762645372', 'kavidu@gmail.com', 2),
	(3, 'Pawan', '0753645456', 'pawan@gmail.com', 3),
	(4, 'Sasidu', '0763463732', 'sasidu@gmail.com', 4);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

-- Dumping structure for table green_herbal.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `nic` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type_id` int NOT NULL,
  `user_status_id` int NOT NULL DEFAULT '1',
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  KEY `fk_user_user_status1_idx` (`user_status_id`),
  KEY `fk_user_city1_idx` (`city_id`),
  CONSTRAINT `fk_user_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_user_user_status1` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `username`, `password`, `contact_number`, `nic`, `user_type_id`, `user_status_id`, `city_id`) VALUES
	(1, 'Ihara', 'ihara', '2001', '0763947527', '200130502218', 1, 1, 1),
	(2, 'Hashitha', 'hashitha', '1234', '0716443112', '200174838844', 2, 1, 1),
	(3, 'Sachindu', 'sachindu', '5678', '0763735463', '200274837481', 2, 1, 4),
	(4, 'Kisal', 'kisal', '6789', '0756372826', '200074927783', 3, 1, 3),
	(5, 'Lakshitha', 'lakshitha', '12345', '0756578483', '200174837749', 3, 1, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table green_herbal.user_status
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.user_status: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` (`id`, `name`) VALUES
	(1, 'Active'),
	(2, 'Inactive');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;

-- Dumping structure for table green_herbal.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table green_herbal.user_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` (`id`, `name`) VALUES
	(1, 'Admin'),
	(2, 'Cashier'),
	(3, 'Employee'),
	(6, 'work');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
