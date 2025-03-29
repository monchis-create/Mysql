USE mi_garaje;


CREATE TABLE registrodecompras(

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    `fechaDeCompra` DATETIME UNIQUE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `productosComprados` VARCHAR(255) NOT NULL,
    `totalCompra` DECIMAL(5,2) NOT NULL,
    `comentarios` VARCHAR(255),
    -- agregue `primerRegistro` y `ultimoRegistro` 
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE clientes(

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
        FOREIGN KEY (`registroDeCompras_id`) REFERENCES `clientes` (`id`)
        FOREIGN KEY (`ingresos_id`) REFERENCES `clientes` (`id`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `clientes_activos` (

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    `clientes_id` BIGINT UNSIGNED NOT NULL,

    `primeraActualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `segundaActualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;








CREATE TABLE electrodomesticos(

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    `tipoDeElectrodomestico` VARCHAR(50) NOT NULL,
    `estadoDelElectrodomestico` VARCHAR(100) NOT NULL,
    `precioDeLaReparacion` DECIMAL(5,2) DEFAULT '0.00',
    `color` VARCHAR(40) NOT NULL,
    -- estas dos `fechaDeRegistro ,`fechaDeEntrega parece que tengo que borrar porque ya tengo `primerRegistro ,`ultimoRegistro
    `fechaDeRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `fechaDeEntrega` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `numeroDeSerie` VARCHAR(50) UNIQUE DEFAULT NULL,
    `clientes_id` BIGINT UNSIGNED NOT NULL,
    -- esta osea me da la impresion que me da problemas pero probemos que pasara pues dejalo mientras tanto
    -- agregue `primerRegistro` y `ultimoRegistro` 
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    CONSTRAINT `clientes_electrodomesticos`
    FOREIGN KEY (`clientes_id`) REFERENCES  `electrodomesticos`(`id`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;






CREATE TABLE copiasdellaves(

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    `otrasLlaves` TEXT DEFAULT NULL,
    `1000` INT DEFAULT NULL,
    `1510` INT DEFAULT NULL,
    `1065` INT DEFAULT NULL,
    `TX70` INT DEFAULT NULL,
    `107` INT DEFAULT NULL,
    `numeroDeCopias` INT NOT NULL DEFAULT '0',
    `copiasMalSacadas` INT DEFAULT NULL,
    -- agregue `primerRegistro` y `ultimoRegistro` 
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;





CREATE TABLE ingresos(

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    `70 % Nec.Basic` DECIMAL(5,2) NOT NULL,
    `10 % invertir` DECIMAL(5,2) NOT NULL,
    `20 % deudas` DECIMAL(5,2) NOT NULL,
    `ingresos` DECIMAL(5,2) NOT NULL,
    `gastos` DECIMAL(5,2) NOT NULL,
    `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `dia` CHAR(25) NOT NULL,
    `motivoDeMisGastos` TEXT DEFAULT NULL,
    -- agregue `primerRegistro` y `ultimoRegistro` 
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `copiasDeLlaves_id` BIGINT UNSIGNED DEFAULT NULL,
    `ingresos_id` BIGINT UNSIGNED DEFAULT NULL,

    PRIMARY KEY (id),
    CONSTRAINT `copiasdellaves_ingresos`
    FOREIGN KEY (`copiasDeLlaves_id`) REFERENCES  `ingresos` (`id`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;



CREATE TABLE ingresos_clientes(

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ingresos_id` BIGINT UNSIGNED NOT NULL,
    `clientes_id` BIGINT UNSIGNED NOT NULL,
    -- agregue `primerRegistro` y `ultimoRegistro` 
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,


    PRIMARY KEY (id),


    CONSTRAINT `ingresos_clientes_ingresos`
        FOREIGN KEY (`ingresos_id`) REFERENCES `ingresos` (`id`),

    CONSTRAINT `ingresos_clientes_clientes`
        FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;





CREATE TABLE metas_semanales(

    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `objetivos_diarios` BIGINT UNSIGNED NOT NULL,
    `objetivos_semanales` BIGINT UNSIGNED NOT NULL,
    `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;