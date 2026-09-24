-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_library
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_library` ;

-- -----------------------------------------------------
-- Schema db_library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_library` ;
USE `db_library` ;

-- -----------------------------------------------------
-- Table `db_library`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_library`.`customer` ;

CREATE TABLE IF NOT EXISTS `db_library`.`customer` (
  `id_customer` INT NOT NULL,
  `customer_name` VARCHAR(100) NOT NULL,
  `customer_email` VARCHAR(100) NULL,
  `customer_address` VARCHAR(200) NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_library`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_library`.`book` ;

CREATE TABLE IF NOT EXISTS `db_library`.`book` (
  `id_book` INT NOT NULL,
  `book_title` VARCHAR(150) NOT NULL,
  `book_author` VARCHAR(100) NULL,
  `book_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_book`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_library`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_library`.`order` ;

CREATE TABLE IF NOT EXISTS `db_library`.`order` (
  `id_order` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `customer_id_customer1` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_order_customer1_idx` (`customer_id_customer1` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id_customer1`)
    REFERENCES `db_library`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_library`.`details_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_library`.`details_orders` ;

CREATE TABLE IF NOT EXISTS `db_library`.`details_orders` (
  `quantity` INT NOT NULL,
  `book_id_book` INT NOT NULL,
  `order_id_order` INT NOT NULL,
  INDEX `fk_details_orders_book1_idx` (`book_id_book` ASC) VISIBLE,
  INDEX `fk_details_orders_order1_idx` (`order_id_order` ASC) VISIBLE,
  CONSTRAINT `fk_details_orders_book1`
    FOREIGN KEY (`book_id_book`)
    REFERENCES `db_library`.`book` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_details_orders_order1`
    FOREIGN KEY (`order_id_order`)
    REFERENCES `db_library`.`order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
