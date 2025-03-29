USE mi_garaje;

-- Esto es para ver la llave foranea de mis tablas :  SHOW CREATE TABLE registrodecompras;

CREATE TABLE registrodecompras (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `fechaDeCompra` DATETIME UNIQUE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `productosComprados` VARCHAR(255) NOT NULL,
    `totalCompra` DECIMAL(5,2) NOT NULL,
    `comentarios` VARCHAR(255),
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `registroDeCompras_id` BIGINT UNSIGNED DEFAULT NULL,
    PRIMARY KEY(id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE clientes (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) DEFAULT NULL,
    `apellido` VARCHAR(45) DEFAULT NULL,
    `direccion` POINT,
    `numeroDeTelefono` CHAR(25) UNIQUE DEFAULT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `primerAbono` DECIMAL(5,2) NOT NULL DEFAULT '0.00',
    `segundoAbono` DECIMAL(5,2) DEFAULT NULL,
    `saldoTotal` DECIMAL(5,2) NOT NULL,
    `comentarios` TEXT DEFAULT NULL,
    `status` TINYINT NOT NULL DEFAULT 0,
    `registroDeCompras_id` BIGINT UNSIGNED DEFAULT NULL,
    `ingresos_id` BIGINT UNSIGNED DEFAULT NULL,
    `clientes_id` BIGINT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `registroDeCompras_clientes`
        FOREIGN KEY (`registroDeCompras_id`) REFERENCES `registrodecompras` (`id`),
    CONSTRAINT `ingresos_clientes_clientes`
        FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE clientes_activos (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `clientes_id` BIGINT UNSIGNED NOT NULL,
    `primeraActualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `segundaActualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE electrodomesticos (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tipoDeElectrodomestico` VARCHAR(50) NOT NULL,
    `estadoDelElectrodomestico` VARCHAR(100) NOT NULL,
    `precioDeLaReparacion` DECIMAL(5,2) DEFAULT '0.00',
    `color` VARCHAR(40) NOT NULL,
    `fechaDeRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `fechaDeEntrega` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `numeroDeSerie` VARCHAR(50) UNIQUE DEFAULT NULL,
    `clientes_id` BIGINT UNSIGNED NOT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT `clientes_electrodomesticos`
        FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE copiasdellaves (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `otrasLlaves` TEXT DEFAULT NULL,
    `1000` INT DEFAULT NULL,
    `1510` INT DEFAULT NULL,
    `1065` INT DEFAULT NULL,
    `TX70` INT DEFAULT NULL,
    `107` INT DEFAULT NULL,
    `numeroDeCopias` INT NOT NULL DEFAULT '0',
    `copiasMalSacadas` INT DEFAULT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `copiasDeLLaves_id` BIGINT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ingresos (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ingresos` DECIMAL(5,2) NOT NULL,
    `gastos` DECIMAL(5,2) NOT NULL,
    `dia` CHAR(25) NOT NULL,
    `motivoDeMisGastos` TEXT DEFAULT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT `copiasdellaves_ingresos`
        FOREIGN KEY (`copiasDeLlaves_id`) REFERENCES `copiasdellaves` (`id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ingresos_clientes (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ingresos_id` BIGINT UNSIGNED NOT NULL,
    `clientes_id` BIGINT UNSIGNED NOT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT `fk_ingresos_clientes_ingresos`
        FOREIGN KEY (`ingresos_id`) REFERENCES `ingresos` (`id`),
    CONSTRAINT `fk_ingresos_clientes_clientes`
        FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE metas_semanales (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `objetivos_diarios` BIGINT UNSIGNED NOT NULL,
    `objetivos_semanales` BIGINT UNSIGNED NOT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;







-- -- ESTA ES UNA TABLA DE EJEMPLO DE IF NOT EXIST
-- -- osea por ejemplo si tengo un respaldo en mi base de datos  y quiero crearla de nuevo a mi bases de datos con mis tablas simplemente para que no me marque error y se cree nuevamente mis tablas, tengo que  usar el IF NOT EXISTS para que se creen nuevamente mis tablas sin problema . contestame si o no en una palabra
-- -- ChatGPT
-- -- Sí

-- CREATE TABLE IF NOT EXISTS people (
-- person_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
-- last_name VARCHAR(255) NULL,
-- first_name VARCHAR(255) NULL,
-- address VARCHAR(255) NULL,
-- city VARCHAR(255) NULL
-- );