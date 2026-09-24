-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_nursery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_nursery` ;

-- -----------------------------------------------------
-- Schema db_nursery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_nursery` ;
USE `db_nursery` ;

-- -----------------------------------------------------
-- Table `db_nursery`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nursery`.`location` ;

CREATE TABLE IF NOT EXISTS `db_nursery`.`location` (
  `location_code` INT NOT NULL,
  `location_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`location_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nursery`.`soil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nursery`.`soil` ;

CREATE TABLE IF NOT EXISTS `db_nursery`.`soil` (
  `soil_category` VARCHAR(1) NOT NULL,
  `soil_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`soil_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nursery`.`plant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nursery`.`plant` ;

CREATE TABLE IF NOT EXISTS `db_nursery`.`plant` (
  `plant_code` INT NOT NULL,
  `plant_name` VARCHAR(100) NOT NULL,
  `soil_soil_category` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`plant_code`),
  INDEX `fk_plant_soil_idx` (`soil_soil_category` ASC) VISIBLE,
  CONSTRAINT `fk_plant_soil`
    FOREIGN KEY (`soil_soil_category`)
    REFERENCES `db_nursery`.`soil` (`soil_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nursery`.`location_plant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nursery`.`location_plant` ;

CREATE TABLE IF NOT EXISTS `db_nursery`.`location_plant` (
  `location_location_code` INT NOT NULL,
  `plant_plant_code` INT NOT NULL,
  PRIMARY KEY (`location_location_code`, `plant_plant_code`),
  INDEX `fk_location_plant_plant1_idx` (`plant_plant_code` ASC) VISIBLE,
  CONSTRAINT `fk_location_plant_location1`
    FOREIGN KEY (`location_location_code`)
    REFERENCES `db_nursery`.`location` (`location_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_plant_plant1`
    FOREIGN KEY (`plant_plant_code`)
    REFERENCES `db_nursery`.`plant` (`plant_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
