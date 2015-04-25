CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `email` VARCHAR(100) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `img_root` VARCHAR(200) NULL,
  `creation_time` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  UNIQUE INDEX `userscol_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`web_apps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`web_apps` (
  `id_web_app` INT(11) NOT NULL AUTO_INCREMENT,
  `web_name` VARCHAR(100) NOT NULL,
  `folder_root` VARCHAR(200) NOT NULL,
  `admin` VARCHAR(100) NOT NULL,
  `private` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_web_app`),
  INDEX `fk_web_apps_users1_idx` (`admin` ASC),
  CONSTRAINT `fk_web_apps_users1`
    FOREIGN KEY (`admin`)
    REFERENCES `mydb`.`users` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`preferences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`preferences` (
  `users_email` VARCHAR(100) NOT NULL,
  `hide_name` TINYINT(1) NOT NULL DEFAULT 0,
  `color_name_hexa` VARCHAR(7) NOT NULL DEFAULT '#1B1B1B',
  `hide_img` TINYINT(1) NOT NULL DEFAULT 0,
  `clock` TINYINT(1) NOT NULL DEFAULT 1,
  INDEX `fk_preferences_users_idx` (`users_email` ASC),
  CONSTRAINT `fk_preferences_users`
    FOREIGN KEY (`users_email`)
    REFERENCES `mydb`.`users` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`permissions` (
  `id_web_app` INT(11) NOT NULL,
  `users_email` VARCHAR(100) NOT NULL,
  `granted` TINYINT(1) NOT NULL DEFAULT 0,
  `revocated` TINYINT(1) NOT NULL DEFAULT 0,
  INDEX `fk_permissions_web_apps1_idx` (`id_web_app` ASC),
  INDEX `fk_permissions_users1_idx` (`users_email` ASC),
  CONSTRAINT `fk_permissions_web_apps1`
    FOREIGN KEY (`id_web_app`)
    REFERENCES `mydb`.`web_apps` (`id_web_app`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissions_users1`
    FOREIGN KEY (`users_email`)
    REFERENCES `mydb`.`users` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`scripts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`scripts` (
  `idscripts` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `root` VARCHAR(200) NOT NULL,
  `suffix` VARCHAR(10) NOT NULL,
  `author` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idscripts`),
  INDEX `fk_scripts_users1_idx` (`author` ASC),
  CONSTRAINT `fk_scripts_users1`
    FOREIGN KEY (`author`)
    REFERENCES `mydb`.`users` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notations` (
  `id_web_app` INT(11) NOT NULL,
  `root` VARCHAR(200) NOT NULL,
  INDEX `fk_notations_web_apps1_idx` (`id_web_app` ASC),
  CONSTRAINT `fk_notations_web_apps1`
    FOREIGN KEY (`id_web_app`)
    REFERENCES `mydb`.`web_apps` (`id_web_app`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resources` (
  `idresources` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `root` VARCHAR(200) NOT NULL,
  `web_apps_id_web_app` INT(11) NOT NULL,
  PRIMARY KEY (`idresources`),
  INDEX `fk_resources_web_apps1_idx` (`web_apps_id_web_app` ASC),
  CONSTRAINT `fk_resources_web_apps1`
    FOREIGN KEY (`web_apps_id_web_app`)
    REFERENCES `mydb`.`web_apps` (`id_web_app`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
