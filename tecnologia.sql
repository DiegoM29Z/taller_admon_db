-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_store_tecnology
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_store_tecnology` ;

-- -----------------------------------------------------
-- Schema db_store_tecnology
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_store_tecnology` ;
USE `db_store_tecnology` ;

-- -----------------------------------------------------
-- Table `db_store_tecnology`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_store_tecnology`.`customer` ;

CREATE TABLE IF NOT EXISTS `db_store_tecnology`.`customer` (
  `id_customer` INT NOT NULL,
  `customer_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_store_tecnology`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_store_tecnology`.`product` ;

CREATE TABLE IF NOT EXISTS `db_store_tecnology`.`product` (
  `id_product` INT NOT NULL,
  `desc_product` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_product`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_store_tecnology`.`purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_store_tecnology`.`purchase` ;

CREATE TABLE IF NOT EXISTS `db_store_tecnology`.`purchase` (
  `customer_id_customer` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  INDEX `fk_purchase_customer1_idx` (`customer_id_customer` ASC) VISIBLE,
  INDEX `fk_purchase_product1_idx` (`product_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `db_store_tecnology`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `db_store_tecnology`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
