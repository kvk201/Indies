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
-- Table `mydb`.`area_master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`area_master` (
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`area`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DOG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DOG` (
  `dog_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nfc_id` VARCHAR(45) NULL,
  `name` VARCHAR(60) NOT NULL,
  `photo` LONGBLOB NULL,
  `age` INT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `description` TEXT(500) NULL,
  `registration_date` DATE NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dog_id`),
  UNIQUE INDEX `nfc_id_UNIQUE` (`nfc_id` ASC),
  INDEX `fk_DOG_area1_idx` (`area` ASC),
  CONSTRAINT `fk_DOG_area1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vet_clinic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vet_clinic` (
  `clinic_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `address` TINYTEXT NULL,
  `phone_no` VARCHAR(45) NULL,
  `email_id` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`clinic_id`),
  INDEX `fk_vet_clinic_area_master1_idx` (`area` ASC),
  CONSTRAINT `fk_vet_clinic_area_master1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vet_doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vet_doctors` (
  `vet_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `phone_no` VARCHAR(45) NULL,
  `email_id` VARCHAR(45) NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`vet_id`),
  INDEX `fk_vet_doctors_area_master1_idx` (`area` ASC),
  CONSTRAINT `fk_vet_doctors_area_master1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`volunteer` (
  `volunteer_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(200) NULL,
  `dob` DATE NOT NULL,
  `gender` ENUM('M', 'F', 'O') NOT NULL,
  `email_id` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NOT NULL,
  `phone_no_secondary` VARCHAR(45) NULL,
  `emergency_no` VARCHAR(45) NULL,
  `registration_date` DATE NOT NULL,
  `reports_to` VARCHAR(100) NULL,
  `affilated_ngo` VARCHAR(100) NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`volunteer_id`),
  INDEX `fk_volunteer_area1_idx` (`area` ASC),
  CONSTRAINT `fk_volunteer_area1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`steralization_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`steralization_history` (
  `steralization_id` INT NOT NULL,
  `dog_id` INT NULL,
  `dog_is_sterelized` ENUM('Y', 'N') NULL,
  `sterelized_on` DATE NULL,
  `sterelization` VARCHAR(100) NULL,
  PRIMARY KEY (`steralization_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VETtoC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VETtoC` (
  `vet_id` INT NOT NULL,
  `clinic_id` INT NOT NULL,
  PRIMARY KEY (`clinic_id`, `vet_id`),
  INDEX `fk_VETtoC_vet_clinic1_idx` (`clinic_id` ASC),
  INDEX `fk_VETtoC_vet_doctors1_idx` (`vet_id` ASC),
  CONSTRAINT `fk_VETtoC_vet_clinic1`
    FOREIGN KEY (`clinic_id`)
    REFERENCES `mydb`.`vet_clinic` (`clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VETtoC_vet_doctors1`
    FOREIGN KEY (`vet_id`)
    REFERENCES `mydb`.`vet_doctors` (`vet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vet_hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vet_hospital` (
  `hospital_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NULL,
  `email_id` VARCHAR(45) NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hospital_id`),
  INDEX `fk_vet_hospital_area_master1_idx` (`area` ASC),
  CONSTRAINT `fk_vet_hospital_area_master1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VETtoH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VETtoH` (
  `vet_id` INT NOT NULL,
  `hospital_id` INT NOT NULL,
  PRIMARY KEY (`vet_id`, `hospital_id`),
  INDEX `fk_VETtoH_vet_doctors1_idx` (`vet_id` ASC),
  INDEX `fk_VETtoH_vet_hospital1_idx` (`hospital_id` ASC),
  CONSTRAINT `fk_VETtoH_vet_doctors1`
    FOREIGN KEY (`vet_id`)
    REFERENCES `mydb`.`vet_doctors` (`vet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VETtoH_vet_hospital1`
    FOREIGN KEY (`hospital_id`)
    REFERENCES `mydb`.`vet_hospital` (`hospital_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dog_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dog_status` (
  `dog_id` INT UNSIGNED NOT NULL,
  `healthy` TINYINT(1) NULL,
  `infirm` TINYINT(1) NULL,
  `disabled` TINYINT(1) NULL,
  `deceased` TINYINT(1) NULL,
  `fostering_availability` TINYINT(1) NULL,
  `fostered_from` DATE NULL,
  `fostered_till` DATE NULL,
  `adoption_availability` TINYINT(1) NULL,
  `adopted_by` VARCHAR(100) NULL,
  `added_by` VARCHAR(100) NULL,
  PRIMARY KEY (`dog_id`),
  CONSTRAINT `fk_dog_status_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`event_id_generator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`event_id_generator` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`event_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sterilization_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sterilization_history` (
  `event_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `dog_id` INT UNSIGNED NOT NULL,
  `is_sterilized` TINYINT(1) NULL,
  `sterilized_on` DATE NULL,
  `sterilized_location` VARCHAR(45) NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_sterilization_history_DOG1_idx` (`dog_id` ASC),
  CONSTRAINT `fk_sterilization_history_event_id_generator1`
    FOREIGN KEY (`event_id`)
    REFERENCES `mydb`.`event_id_generator` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sterilization_history_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vaccination_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vaccination_history` (
  `event_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `dog_id` INT UNSIGNED NOT NULL,
  `vaccine_name` VARCHAR(45) NULL,
  `is_vaccinated` TINYINT(1) NULL,
  `vaccinated_on` DATE NULL,
  `vaccinated_till` DATE NULL,
  `**vaccinated_location` VARCHAR(45) NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_vaccination_history_DOG1_idx` (`dog_id` ASC),
  CONSTRAINT `fk_vaccination_history_event_id_generator1`
    FOREIGN KEY (`event_id`)
    REFERENCES `mydb`.`event_id_generator` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vaccination_history_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`general_medical_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`general_medical_history` (
  `event_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `dog_id` INT UNSIGNED NOT NULL,
  `description` TEXT(200) NULL,
  `is_treated` TINYINT(1) NULL,
  `treated_by` VARCHAR(45) NULL,
  `treated_on` DATETIME NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_general_medical_history_DOG1_idx` (`dog_id` ASC),
  CONSTRAINT `fk_general_medical_history_event_id_generator1`
    FOREIGN KEY (`event_id`)
    REFERENCES `mydb`.`event_id_generator` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_general_medical_history_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`events_RFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`events_RFA` (
  `event_id` INT NOT NULL,
  `event_type` VARCHAR(45) NULL,
  `dog_id` INT UNSIGNED NOT NULL,
  `volunteer_id` INT NULL,
  `event_status` TINYINT(1) NULL,
  `starting_time` DATETIME NULL,
  `ending_time` DATETIME NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_events_RFA_DOG1_idx` (`dog_id` ASC),
  CONSTRAINT `fk_events_RFA_event_id_generator1`
    FOREIGN KEY (`event_id`)
    REFERENCES `mydb`.`event_id_generator` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_RFA_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer_availabilty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`volunteer_availabilty` (
  `volunteer_id` INT NOT NULL,
  `monday` TINYINT(1) NULL,
  `monday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  `tuesday` TINYINT(1) NULL,
  `tuesday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  `wednesday` TINYINT(1) NULL,
  `wednesday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  `thursday` TINYINT(1) NULL,
  `thursday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  `friday` TINYINT(1) NULL,
  `friday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  `saturday` TINYINT(1) NULL,
  `saturday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  `sunday` TINYINT(1) NULL,
  `sunday_time` ENUM('T1', 'T2', 'T3', 'T4') NULL,
  PRIMARY KEY (`volunteer_id`),
  CONSTRAINT `fk_volunteer_availabilty_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`relevant_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`relevant_skills` (
  `volunteer_id` INT NOT NULL,
  `vet_training` TINYINT(1) NULL,
  `emegency_medical_training` TINYINT(1) NULL,
  `it` TINYINT(1) NULL,
  `graphics_design` TINYINT(1) NULL,
  `legal_expertise` TINYINT(1) NULL,
  `carpentery_repair` TINYINT(1) NULL,
  `photography_video` TINYINT(1) NULL,
  `event_management` TINYINT(1) NULL,
  `content_writing` TINYINT(1) NULL,
  `art` TINYINT(1) NULL,
  `marketting` TINYINT(1) NULL,
  `teaching` TINYINT(1) NULL,
  `other_skills` TEXT NULL,
  `previous_experience` TEXT NULL,
  PRIMARY KEY (`volunteer_id`),
  CONSTRAINT `fk_relevant_skills_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`current_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`current_location` (
  `volunteer_id` INT NOT NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `location_time` TIMESTAMP NULL,
  PRIMARY KEY (`volunteer_id`),
  CONSTRAINT `fk_current_location_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer_authentication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`volunteer_authentication` (
  `volunteer_id` INT NOT NULL,
  `id_proof1` BLOB NULL,
  `id_proof2` BLOB NULL,
  `user_id` VARCHAR(50) NULL,
  `password` VARCHAR(100) NULL,
  `security_clearance_level` ENUM('WH', 'V') NULL,
  PRIMARY KEY (`volunteer_id`),
  CONSTRAINT `fk_volunteer_authentication_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`virtual_bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`virtual_bank` (
  `area` VARCHAR(45) NOT NULL,
  `funds` FLOAT NULL,
  `reserved_funds` FLOAT NULL,
  PRIMARY KEY (`area`),
  CONSTRAINT `fk_area_virtual_bank_area_master1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`donation_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`donation_records` (
  `donation_id` INT NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `name` VARCHAR(100) NULL,
  `pan_number` VARCHAR(30) NULL,
  `amount` FLOAT NULL,
  `address` TEXT NULL,
  `phone_number` VARCHAR(20) NULL,
  `mode_of_payment` ENUM('CHK', 'DD', 'OLN', 'DBC', 'CC') NULL,
  PRIMARY KEY (`donation_id`),
  INDEX `fk_donation_records_area_master1_idx` (`area` ASC),
  CONSTRAINT `fk_donation_records_area_master1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`task_id_generator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`task_id_generator` (
  `task_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`task_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`task_general`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`task_general` (
  `task_id` INT NOT NULL,
  `task_type` VARCHAR(45) NULL,
  `dog_id` INT UNSIGNED NOT NULL,
  `task description` VARCHAR(45) NULL,
  `date` DATE NULL,
  `active` TINYINT(1) NULL,
  `status` ENUM('complete', 'pending') NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_task_general_DOG1_idx` (`dog_id` ASC),
  CONSTRAINT `fk_task_general_task_id_generator1`
    FOREIGN KEY (`task_id`)
    REFERENCES `mydb`.`task_id_generator` (`task_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_general_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tasks_feeding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tasks_feeding` (
  `task_id` INT NOT NULL,
  `task_type` VARCHAR(45) NULL,
  `dog_id` INT UNSIGNED NOT NULL,
  `date` DATE NULL,
  `active` TINYINT(1) NULL,
  `status` ENUM('completed', 'pending') NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_tasks_feeding_DOG1_idx` (`dog_id` ASC),
  CONSTRAINT `fk_feeding_data_permanent_task_id_generator1`
    FOREIGN KEY (`task_id`)
    REFERENCES `mydb`.`task_id_generator` (`task_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_feeding_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feeding_data_permanent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`feeding_data_permanent` (
  `dog_id` INT UNSIGNED NOT NULL,
  `last_fed_on` DATE NULL,
  PRIMARY KEY (`dog_id`),
  CONSTRAINT `fk_feeding_data_permanent_DOG1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `mydb`.`DOG` (`dog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer_task_tracker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`volunteer_task_tracker` (
  `task_id` INT NOT NULL,
  `volunteer_id` INT NOT NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_volunteer_task_tracker_volunteer1_idx` (`volunteer_id` ASC),
  CONSTRAINT `fk_volunteer_task_tracker_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer_event_tracker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`volunteer_event_tracker` (
  `event_id` INT NOT NULL,
  `volunteer_id` INT NOT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_volunteer_event_tracker_volunteer1_idx` (`volunteer_id` ASC),
  CONSTRAINT `fk_volunteer_event_tracker_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`expenditure_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`expenditure_records` (
  `expenditure_id` INT NOT NULL,
  `amount` FLOAT NULL,
  `area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`expenditure_id`),
  INDEX `fk_expenditure_records_area_master1_idx` (`area` ASC),
  CONSTRAINT `fk_expenditure_records_area_master1`
    FOREIGN KEY (`area`)
    REFERENCES `mydb`.`area_master` (`area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb`;

DELIMITER $$
USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`donation_records_AFTER_INSERT` AFTER INSERT ON `donation_records` FOR EACH ROW
BEGIN
	UPDATE virtual_bank SET virtual_bank.funds = (virtual_bank.funds + inserted.amount) WHERE virtual_bank.area=inserted.area;
END$$

USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`expenditure_records_AFTER_INSERT` AFTER INSERT ON `expenditure_records` FOR EACH ROW
BEGIN
	UPDATE virtual_bank SET virtual_bank.funds = (virtual_bank.funds - inserted.amount) WHERE virtual_bank.area=inserted.area;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
