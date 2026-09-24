-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_rent_movie
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_rent_movie` ;

-- -----------------------------------------------------
-- Schema db_rent_movie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_rent_movie` ;
USE `db_rent_movie` ;

-- -----------------------------------------------------
-- Table `db_rent_movie`.`salutation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_rent_movie`.`salutation` ;

CREATE TABLE IF NOT EXISTS `db_rent_movie`.`salutation` (
  `id_salutation` INT NOT NULL,
  `salutation_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_salutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_rent_movie`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_rent_movie`.`movie` ;

CREATE TABLE IF NOT EXISTS `db_rent_movie`.`movie` (
  `id_movie` INT NOT NULL,
  `movie_title` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_movie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_rent_movie`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_rent_movie`.`client` ;

CREATE TABLE IF NOT EXISTS `db_rent_movie`.`client` (
  `id_client` INT NOT NULL,
  `full_names` VARCHAR(100) NOT NULL,
  `physical_adress` VARCHAR(200) NOT NULL,
  `salutation_id_salutation` INT NOT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_client_salutation_idx` (`salutation_id_salutation` ASC) VISIBLE,
  CONSTRAINT `fk_client_salutation`
    FOREIGN KEY (`salutation_id_salutation`)
    REFERENCES `db_rent_movie`.`salutation` (`id_salutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_rent_movie`.`rent_movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_rent_movie`.`rent_movies` ;

CREATE TABLE IF NOT EXISTS `db_rent_movie`.`rent_movies` (
  `id_rent_movies` INT NOT NULL,
  `client_id_client` INT NOT NULL,
  `movie_id_movie` INT NOT NULL,
  PRIMARY KEY (`id_rent_movies`),
  INDEX `fk_rent_movies_client1_idx` (`client_id_client` ASC) VISIBLE,
  INDEX `fk_rent_movies_movie1_idx` (`movie_id_movie` ASC) VISIBLE,
  CONSTRAINT `fk_rent_movies_client1`
    FOREIGN KEY (`client_id_client`)
    REFERENCES `db_rent_movie`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rent_movies_movie1`
    FOREIGN KEY (`movie_id_movie`)
    REFERENCES `db_rent_movie`.`movie` (`id_movie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
