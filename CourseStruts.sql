-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema course_struts
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema course_struts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `course_struts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `course_struts` ;

-- -----------------------------------------------------
-- Table `course_struts`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_struts`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `birthday` DATE NOT NULL,
  `phone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_struts`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_struts`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_struts`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_struts`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Status_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Status_id`),
  INDEX `fk_Rol_Status1_idx` (`Status_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rol_Status1`
    FOREIGN KEY (`Status_id`)
    REFERENCES `course_struts`.`status` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_struts`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_struts`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status_id` INT NOT NULL,
  `Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Status_id`, `Person_id`),
  INDEX `fk_User_Status1_idx` (`Status_id` ASC) VISIBLE,
  INDEX `fk_User_Person1_idx` (`Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `course_struts`.`person` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_User_Status1`
    FOREIGN KEY (`Status_id`)
    REFERENCES `course_struts`.`status` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_struts`.`rol_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_struts`.`rol_has_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Rol_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Rol_has_User_User1_idx` (`User_id` ASC) VISIBLE,
  INDEX `fk_Rol_has_User_Rol_idx` (`Rol_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rol_has_User_Rol`
    FOREIGN KEY (`Rol_id`)
    REFERENCES `course_struts`.`rol` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Rol_has_User_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `course_struts`.`user` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `course_struts` ;

-- -----------------------------------------------------
-- Placeholder table for view `course_struts`.`userdata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_struts`.`userdata` (`idUser` INT, `email` INT, `password` INT, `Person_id` INT, `idPerson` INT, `name` INT, `surname` INT, `lastname` INT, `birthday` INT, `phone` INT, `idRolUser` INT, `Rol_id` INT, `User_id` INT, `idStatus` INT, `name_status` INT, `rolName` INT, `rolStatus` INT);

-- -----------------------------------------------------
-- procedure deleteUser
-- -----------------------------------------------------

DELIMITER $$
USE `course_struts`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser`(
in idPerson int,
in idUser int)
BEGIN
delete from rol_has_user where User_id = idUser; 
delete from person where id = idPerson;
delete from user where id = idUser;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure registerUser
-- -----------------------------------------------------

DELIMITER $$
USE `course_struts`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registerUser`(
in pname varchar(60),
in psurname varchar(60),
in plastname varchar(60),
in pbirthday date,
in pphone varchar(20),
in uemail varchar(100),
in upassword varchar(60),
in user_status_id int,
in user_rol_id int)
BEGIN
   INSERT INTO person(name,surname,lastname,birthday,phone) values(pname,psurname,plastname,pbirthday,pphone);
   SET @person_id = last_insert_id();
   INSERT INTO user(email,password,create_at,Status_id,Person_id) values(uemail,upassword,current_date,user_status_id,@person_id);
   SET @user_id = last_insert_id();
	INSERT INTO rol_has_user(Rol_id,User_id) VALUES(user_rol_id,@user_id);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure updateUser
-- -----------------------------------------------------

DELIMITER $$
USE `course_struts`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(
in idPerson int,
in pname varchar(60),
in psurname varchar(60),
in plastname varchar(60),
in pphone varchar(20),
in idUser int,
in uemail varchar(100),
in upassword varchar(60),
in user_status_id int,
in user_rol_id int)
BEGIN

update person set name = pname,surname = psurname,lastname = plastname,phone = pphone where id = idPerson;
   /*INSERT INTO person(name,surname,lastname,birthday,phone) values(pname,psurname,plastname,pbirthday,pphone);*/
   update user set email = uemail,password = upassword,Status_id = user_status_id where id = idUser;
   /*INSERT INTO user(email,password,create_at,Status_id,Person_id) values(uemail,upassword,current_date,user_status_id,@person_id);*/
  update rol_has_user set Rol_id = user_rol_id, User_id = idUser;
	
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `course_struts`.`userdata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course_struts`.`userdata`;
USE `course_struts`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `course_struts`.`userdata` AS select `course_struts`.`user`.`id` AS `idUser`,`course_struts`.`user`.`email` AS `email`,`course_struts`.`user`.`password` AS `password`,`course_struts`.`user`.`Person_id` AS `Person_id`,`course_struts`.`person`.`id` AS `idPerson`,`course_struts`.`person`.`name` AS `name`,`course_struts`.`person`.`surname` AS `surname`,`course_struts`.`person`.`lastname` AS `lastname`,`course_struts`.`person`.`birthday` AS `birthday`,`course_struts`.`person`.`phone` AS `phone`,`course_struts`.`rol_has_user`.`id` AS `idRolUser`,`course_struts`.`rol_has_user`.`Rol_id` AS `Rol_id`,`course_struts`.`rol_has_user`.`User_id` AS `User_id`,`course_struts`.`status`.`id` AS `idStatus`,`course_struts`.`status`.`name` AS `name_status`,`course_struts`.`rol`.`name` AS `rolName`,`course_struts`.`rol`.`Status_id` AS `rolStatus` from ((((`course_struts`.`user` join `course_struts`.`status` on((`course_struts`.`user`.`Status_id` = `course_struts`.`status`.`id`))) join `course_struts`.`person` on((`course_struts`.`user`.`Person_id` = `course_struts`.`person`.`id`))) join `course_struts`.`rol_has_user` on((`course_struts`.`rol_has_user`.`User_id` = `course_struts`.`user`.`id`))) join `course_struts`.`rol` on((`course_struts`.`rol_has_user`.`Rol_id` = `course_struts`.`rol`.`id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*




use course_struts;

SET GLOBAL time_zone = '+8:00';

select *from status;
select *from user;
truncate table user;
select *from person;
truncate table person;
truncate table rol_has_user;
delete from rol_has_user where id = 2;
select *from rol;
truncate table rol;

CREATE OR REPLACE VIEW userData AS
select user.id as idUser,user.email,user.password,user.Person_id,person.id as idPerson,
person.name,person.surname,person.lastname,person.birthday,person.phone,rol_has_user.id as idRolUser,rol_has_user.Rol_id,rol_has_user.User_id,status.id as idStatus,status.name as name_status, 
rol.name as rolName,rol.Status_id as rolStatus from user
inner join status on user.Status_id = status.id
inner join person on user.Person_id = person.id 
inner join rol_has_user on rol_has_user.User_id = user.id
inner join rol on rol_has_user.Rol_id = rol.id;

select *from userData;



insert into rol values(1,"Admin",1);
insert into rol values(2,"Alumno",1);
insert into status values(1,"Activo");
insert into status values(2,"Inactivo");
/*-------------------------*/
drop procedure registerUser;

DELIMITER $$
CREATE PROCEDURE registerUser(
in pname varchar(60),
in psurname varchar(60),
in plastname varchar(60),
in pbirthday date,
in pphone varchar(20),
in uemail varchar(100),
in upassword varchar(60),
in user_status_id int,
in user_rol_id int)
BEGIN
   INSERT INTO person(name,surname,lastname,birthday,phone) values(pname,psurname,plastname,pbirthday,pphone);
   SET @person_id = last_insert_id();
   INSERT INTO user(email,password,create_at,Status_id,Person_id) values(uemail,upassword,current_date,user_status_id,@person_id);
   SET @user_id = last_insert_id();
	INSERT INTO rol_has_user(Rol_id,User_id) VALUES(user_rol_id,@user_id);
END$$


CREATE PROCEDURE updateUser(
in idPerson int,
in pname varchar(60),
in psurname varchar(60),
in plastname varchar(60),
in pphone varchar(20),
in idUser int,
in uemail varchar(100),
in upassword varchar(60),
in user_status_id int,
in user_rol_id int)
BEGIN

update person set name = pname,surname = psurname,lastname = plastname,phone = pphone where id = idPerson;
   /*INSERT INTO person(name,surname,lastname,birthday,phone) values(pname,psurname,plastname,pbirthday,pphone);*/
   update user set email = uemail,password = upassword,Status_id = user_status_id where id = idUser;
   /*INSERT INTO user(email,password,create_at,Status_id,Person_id) values(uemail,upassword,current_date,user_status_id,@person_id);*/
  update rol_has_user set Rol_id = user_rol_id, User_id = idUser;
	
END$$



CREATE PROCEDURE deleteUser(
in idPerson int,
in idUser int)
BEGIN
delete from rol_has_user where User_id = idUser; 
delete from person where id = idPerson;
delete from user where id = idUser;


END$$

select *from user;












*/