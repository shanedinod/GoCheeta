-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gocheetadb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gocheetadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gocheetadb` DEFAULT CHARACTER SET utf8 ;
USE `gocheetadb` ;

-- -----------------------------------------------------
-- Table `gocheetadb`.`userdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`userdetail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gocheetadb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`customer` (
  `cus_id` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  `mobile` INT NULL,
  `email` VARCHAR(100) NULL,
  `address` TEXT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`cus_id`),
  INDEX `fk_customer_userdetail1_idx` (`user_id` ASC),
  CONSTRAINT `fk_customer_userdetail1`
    FOREIGN KEY (`user_id`)
    REFERENCES `gocheetadb`.`userdetail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gocheetadb`.`vehicle_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`vehicle_type` (
  `idvehicle_type` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `vehicle_typecol` VARCHAR(45) NULL,
  PRIMARY KEY (`idvehicle_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gocheetadb`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`vehicle` (
  `vehicle_id` VARCHAR(8) NOT NULL,
  `name` VARCHAR(45) NULL,
  `seat` INT NULL,
  `vehiclecol` VARCHAR(45) NULL,
  `vehicle_type` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  INDEX `fk_vehicle_vehicle_type_idx` (`vehicle_type` ASC),
  CONSTRAINT `fk_vehicle_vehicle_type`
    FOREIGN KEY (`vehicle_type`)
    REFERENCES `gocheetadb`.`vehicle_type` (`idvehicle_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gocheetadb`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`branch` (
  `idbranch` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `branchcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idbranch`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gocheetadb`.`driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`driver` (
  `license_id` INT NOT NULL,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  `mobile` INT NULL,
  `email` VARCHAR(100) NULL,
  `address` TEXT NULL,
  `status` VARCHAR(45) NULL,
  `userdetail_id` INT NOT NULL,
  `vehicle_vehicle_id` VARCHAR(8) NOT NULL,
  `branch_idbranch` INT NOT NULL,
  PRIMARY KEY (`license_id`),
  INDEX `fk_driver_userdetail1_idx` (`userdetail_id` ASC),
  INDEX `fk_driver_vehicle1_idx` (`vehicle_vehicle_id` ASC),
  INDEX `fk_driver_branch1_idx` (`branch_idbranch` ASC),
  CONSTRAINT `fk_driver_userdetail1`
    FOREIGN KEY (`userdetail_id`)
    REFERENCES `gocheetadb`.`userdetail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_driver_vehicle1`
    FOREIGN KEY (`vehicle_vehicle_id`)
    REFERENCES `gocheetadb`.`vehicle` (`vehicle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_driver_branch1`
    FOREIGN KEY (`branch_idbranch`)
    REFERENCES `gocheetadb`.`branch` (`idbranch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gocheetadb`.`ride`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gocheetadb`.`ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pickup` TEXT NULL,
  `drop` TEXT NULL,
  `price` DOUBLE NULL,
  `datetime` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `customer_cus_id` INT NOT NULL,
  `driver_license_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_customer1_idx` (`customer_cus_id` ASC),
  INDEX `fk_ride_driver1_idx` (`driver_license_id` ASC),
  CONSTRAINT `fk_ride_customer1`
    FOREIGN KEY (`customer_cus_id`)
    REFERENCES `gocheetadb`.`customer` (`cus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_driver1`
    FOREIGN KEY (`driver_license_id`)
    REFERENCES `gocheetadb`.`driver` (`license_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
