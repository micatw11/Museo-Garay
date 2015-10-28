SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Proy_Museo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Proy_Museo` ;

-- -----------------------------------------------------
-- Table `Proy_Museo`.`personas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`personas` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`personas` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cuil_cuit` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fechaCarga` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`donantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`donantes` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`donantes` (
  `id` INT NOT NULL COMMENT '	',
  `Persona_id` INT NOT NULL,
  `fechaCarga` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Donante_Persona_idx` (`Persona_id` ASC),
  CONSTRAINT `fk_Donante_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Proy_Museo`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`usuarios` (
  `id` INT NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_persona1_idx` (`persona_id` ASC),
  CONSTRAINT `fk_usuario_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `Proy_Museo`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`fondos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`fondos` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`fondos` (
  `id` INT UNSIGNED NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  `fechaCarga` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_fondos_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_fondos_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Proy_Museo`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fondos_clasificacion1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Proy_Museo`.`clasificaciones` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`clasificaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`clasificaciones` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`clasificaciones` (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  `fondo_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC),
  INDEX `fk_clasificaciones_fondos1_idx` (`fondo_id` ASC),
  CONSTRAINT `fk_clasificaciones_fondos1`
    FOREIGN KEY (`fondo_id`)
    REFERENCES `Proy_Museo`.`fondos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`piezas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`piezas` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`piezas` (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `procedencia` VARCHAR(45) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `tema` VARCHAR(45) NOT NULL,
  `observacion` VARCHAR(45) NOT NULL,
  `clasificacion_id` INT NOT NULL,
  `fechaEjecucion` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pieza_clasificacion1_idx` (`clasificacion_id` ASC),
  CONSTRAINT `fk_pieza_clasificacion1`
    FOREIGN KEY (`clasificacion_id`)
    REFERENCES `Proy_Museo`.`clasificaciones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`donaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`donaciones` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`donaciones` (
  `id` INT NOT NULL,
  `donante_id` INT NOT NULL,
  `pieza_id` INT NOT NULL,
  `fechaDonacion` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_donacion_donante1_idx` (`donante_id` ASC),
  INDEX `fk_donacion_pieza1_idx` (`pieza_id` ASC),
  CONSTRAINT `fk_donacion_donante1`
    FOREIGN KEY (`donante_id`)
    REFERENCES `Proy_Museo`.`donantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donacion_pieza1`
    FOREIGN KEY (`pieza_id`)
    REFERENCES `Proy_Museo`.`piezas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`log` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`log` (
  `id` INT UNSIGNED NOT NULL,
  `usuario_id` INT NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `operacion` VARCHAR(45) NOT NULL,
  `objeto_id` VARCHAR(45) NOT NULL,
  `tabla` VARCHAR(45) NOT NULL,
  `datos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_log_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Proy_Museo`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`vigencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`vigencias` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`vigencias` (
  `id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `fecha alta` DATE NOT NULL,
  `fecha hasta` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vigencia_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_vigencia_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Proy_Museo`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proy_Museo`.`revisiones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proy_Museo`.`revisiones` ;

CREATE TABLE IF NOT EXISTS `Proy_Museo`.`revisiones` (
  `id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `pieza_id` INT NOT NULL,
  `estadoDeConservacion` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  `fechaRevision` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_revisiones_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_revisiones_pieza1_idx` (`pieza_id` ASC),
  CONSTRAINT `fk_revisiones_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Proy_Museo`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_revisiones_pieza1`
    FOREIGN KEY (`pieza_id`)
    REFERENCES `Proy_Museo`.`piezas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
