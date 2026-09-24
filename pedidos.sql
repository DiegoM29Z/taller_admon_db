-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_pedidos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bd_pedidos` ;

-- -----------------------------------------------------
-- Schema bd_pedidos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_pedidos` ;
USE `bd_pedidos` ;

-- -----------------------------------------------------
-- Table `bd_pedidos`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bd_pedidos`.`estado` ;

CREATE TABLE IF NOT EXISTS `bd_pedidos`.`estado` (
  `id_estado` INT NOT NULL,
  `nombre_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_pedidos`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bd_pedidos`.`cliente` ;

CREATE TABLE IF NOT EXISTS `bd_pedidos`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nombre_cliente` VARCHAR(100) NOT NULL,
  `estado_id_estado` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_estado_idx` (`estado_id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_estado`
    FOREIGN KEY (`estado_id_estado`)
    REFERENCES `bd_pedidos`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_pedidos`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bd_pedidos`.`item` ;

CREATE TABLE IF NOT EXISTS `bd_pedidos`.`item` (
  `id_item` INT NOT NULL,
  `des_item` VARCHAR(100) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_item`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_pedidos`.`ordenes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bd_pedidos`.`ordenes` ;

CREATE TABLE IF NOT EXISTS `bd_pedidos`.`ordenes` (
  `id_orden` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_orden_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_orden_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `bd_pedidos`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_pedidos`.`ordenes_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bd_pedidos`.`ordenes_item` ;

CREATE TABLE IF NOT EXISTS `bd_pedidos`.`ordenes_item` (
  `cantidad` INT NOT NULL,
  `item_id_item` INT NOT NULL,
  `ordenes_id_orden` INT NOT NULL,
  INDEX `fk_ordenes_item_item1_idx` (`item_id_item` ASC) VISIBLE,
  INDEX `fk_ordenes_item_ordenes1_idx` (`ordenes_id_orden` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_item_item1`
    FOREIGN KEY (`item_id_item`)
    REFERENCES `bd_pedidos`.`item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_item_ordenes1`
    FOREIGN KEY (`ordenes_id_orden`)
    REFERENCES `bd_pedidos`.`ordenes` (`id_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
