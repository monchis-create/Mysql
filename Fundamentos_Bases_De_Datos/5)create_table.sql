
-- ON UPDATE :cada vez que haga un update por ejemplo voy a la tabla usuarios y el usuario que es el numero 10 ahora lo cambio al numero 11 que va a pasar con esa tabla que ya tenia una liga con la tabla ingresos por ejemplo: cascade quiere decir cada vez que se haga un update en la tabla usuarios tambien se haga un update en la tabla ingresos, osea cada vez que cambia de 10 a 11 en la tabla usuarios en la tabla ingresos tambien cambiara de 10 a 11 y no se va a romper la informacion que tenemos.

-- ON DELETE : Es la accion que quiero que se realize cuando borren el usuario que va a pasar cuando derepente borren el usuario de nuestra base de datos que creo un post pues simplemente va a ver un post que se va a quedar huerfano , si queremos eso dejo la opcion NO ACTION .
-- pero tambien hay la opcion de CASCADE lo que va hacer es si borran el usuario se borran todos los post relacionados con el de la otra tabla,
-- tambien existe SET NULL que lo que hace es cuando el usuario desaparesca a quien el la tabla de usuarios en el id me lo va a poner un NULO, Esta opcion tal vez no me lo permita porque pusimos que no fuera nulo el usuario id,
-- RESTRICT quiere decir que cada vez que quiera borrar un usuario que tiene un blog post asociado , me dice no , no , no puedes borrar ese usuario hasta que vayas y borres esos blog posts para que te asegures que no haya informacion perdida ahi.



CREATE TABLE `platziblog`.`people` (
    `person_id` INT NOT NULL AUTO_INCREMENT,
    `last_name` VARCHAR(255) NULL,
    `firts_name` VARCHAR(255)NULL,
    `address` VARCHAR(255) NULL,
    `cyty` VARCHAR(255) NULL,

    PRIMARY KEY (`person_id`)
);



CREATE TABLE `platziblog`.`categoria` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre_categoria` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
);



CREATE TABLE `platziblog`.`usuarios` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(30) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `nickname` VARCHAR(40) NOT NULL,
    `email` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`id`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC)
);













-- Es esta tabla ya vas a ver mas abajo como se altera una tabla para poner las llaves foraneas. OJO AHI.
CREATE TABLE `platziblog`.`posts` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(130) NOT NULL,
    `fecha_publicacion` TIMESTAMP NULL,
    `contenido` TEXT NOT NULL,
    `estatus` CHAR(8) NULL DEFAULT `activo`,
    `usuario_id` INT NOT NULL,
    `categoria_id` INT NOT NULL,

    PRIMARY KEY (`id`)
);


ALTER TABLE `platziblog`.`posts`
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC);
;
ALTER TABLE `platziblog`.`posts`
ADD CONSTRAINT `posts_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `platziblog`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;




ALTER TABLE `platziblog`.`posts`
ADD INDEX `posts_categorias_idx` (`categoria_id` ASC);
;
ALTER TABLE `platziblog`.`posts`
ADD CONSTRAINT `posts_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `platziblog`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;











CREATE TABLE `platziblog`.`comentarios` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `cuerpo_comentario` TEXT NOT NULL,
    `usuario_id` INT NOT NULL,
    `post_id` INT NOT NULL,

    PRIMARY KEY (`id`)
);