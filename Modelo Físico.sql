-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TrabalhoIAP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TrabalhoIAP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TrabalhoIAP` DEFAULT CHARACTER SET utf8 ;
USE `TrabalhoIAP` ;

-- -----------------------------------------------------
-- Table `TrabalhoIAP`.`GenBank_Informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabalhoIAP`.`GenBank_Informations` (
  `locusid` VARCHAR(255) NOT NULL,
  `dnasource` TEXT NULL,
  `definition` TEXT NULL,
  `pubmedcod` VARCHAR(255) NULL,
  `dnasequence` LONGTEXT NOT NULL,
  `length` VARCHAR(25) NULL,
  PRIMARY KEY (`locusid`),
  UNIQUE INDEX `locusid_UNIQUE` (`locusid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabalhoIAP`.`PubMed_Informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabalhoIAP`.`PubMed_Informations` (
  `pubmedcod` VARCHAR(255) NOT NULL,
  `locusid` VARCHAR(255) NOT NULL,
  `publication_link` TEXT NULL,
  `authors` TEXT NULL,
  `title` TEXT NULL,
  `affiliation` TEXT NULL,
  `abstract` TEXT NULL,
  `publication_date` TEXT NULL,
  PRIMARY KEY (`pubmedcod`),
  INDEX `FK1_idx` (`locusid` ASC) VISIBLE,
  UNIQUE INDEX `locusid_UNIQUE` (`locusid` ASC) VISIBLE,
  UNIQUE INDEX `pubmedcod_UNIQUE` (`pubmedcod` ASC) VISIBLE,
  CONSTRAINT `FK1`
    FOREIGN KEY (`locusid`)
    REFERENCES `TrabalhoIAP`.`GenBank_Informations` (`locusid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabalhoIAP`.`Protein_Informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabalhoIAP`.`Protein_Informations` (
  `locus_protein` VARCHAR(255) NOT NULL,
  `locus_dna` VARCHAR(45) NOT NULL,
  `source` TEXT NULL,
  `definition` TEXT NULL,
  `proteinsequence` LONGTEXT NOT NULL,
  `length` VARCHAR(25) NULL,
  UNIQUE INDEX `locus_dna_UNIQUE` (`locus_protein` ASC) VISIBLE,
  PRIMARY KEY (`locus_protein`),
  UNIQUE INDEX `locus_dna_UNIQUE` (`locus_dna` ASC) VISIBLE,
  CONSTRAINT `FK2`
    FOREIGN KEY (`locus_dna`)
    REFERENCES `TrabalhoIAP`.`GenBank_Informations` (`locusid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
