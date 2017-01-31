-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `id` INT NOT NULL,
  `chromosome` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `description_mutated_gene` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diagnosis` (
  `idDiagnosis` INT NOT NULL,
  `Syndrome_name` VARCHAR(45) NULL,
  `description_syndrome` VARCHAR(45) NULL,
  `mutation_found` INT NULL,
  PRIMARY KEY (`idDiagnosis`),
  INDEX `fk_Diagnosis_1_idx` (`mutation_found` ASC),
  CONSTRAINT `fk_Diagnosis_1`
    FOREIGN KEY (`mutation_found`)
    REFERENCES `mydb`.`Mutation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `sex` ENUM('M', 'F') NULL,
  `patient_syndrome` INT NULL,
  `age_diagnosis` DATE NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_Patient_1_idx` (`patient_syndrome` ASC),
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`patient_syndrome`)
    REFERENCES `mydb`.`Diagnosis` (`idDiagnosis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
