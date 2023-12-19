

-- MySQL Script generated by MySQL Workbench
-- Tue Dec 19 11:55:00 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `labcars` DEFAULT CHARACTER SET utf8 ;
USE `labcars` ;

-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cars` ;

CREATE TABLE IF NOT EXISTS `labcars`.`cars` (
  id INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(17) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45),
  `year` YEAR NULL,
  `color` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE salesperson(
				id int AUTO_INCREMENT,
                staff_id int,
                name VARCHAR(50),
                store VARCHAR(50),
                PRIMARY KEY(id));
                
CREATE TABLE customers(
				id int AUTO_INCREMENT,
                name VARCHAR(50),
                phone_number VARCHAR(50),
                email VARCHAR(50),
                address VARCHAR(50),
                city VARCHAR(50),
                state_province VARCHAR(50),
                country VARCHAR(50),
                zip_code INT,
                PRIMARY KEY(id)
);

-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `labcars`.`invoices` ;

CREATE TABLE IF NOT EXISTS `labcars`.`invoices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `invoicenumber` INT NULL,
  `date` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `salesperson` VARCHAR(45) NULL,
  `cars_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoices_cars_idx` (`cars_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_id`)
    REFERENCES `labcars`.`cars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


ALTER TABLE invoices
MODIFY salesperson INT;

ALTER TABLE invoices
ADD CONSTRAINT salespersonconnection FOREIGN KEY(salesperson) REFERENCES salesperson (`id`); 

ALTER TABLE invoices
MODIFY customer INT;

ALTER TABLE invoices
ADD CONSTRAINT customerconnection FOREIGN KEY(customer) REFERENCES customers (`id`); 



ALTER TABLE invoices
DROP CONSTRAINT customerconnection; 

ALTER TABLE customers
MODIFY id int;

ALTER TABLE invoices
MODIFY customer int;

ALTER TABLE invoices
ADD CONSTRAINT customerconnection FOREIGN KEY(customer) REFERENCES customers (`id`); 
