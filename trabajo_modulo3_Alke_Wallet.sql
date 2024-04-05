/*Crea BD AlkeWallet*/
CREATE SCHEMA `AlkeWallet` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;

/*Crea tabla usuarios*/
CREATE TABLE `AlkeWallet`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `passwd` VARCHAR(45) NOT NULL,
  `balance` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
CHARACTER SET = utf8 ,
COLLATE = utf8_spanish_ci ;

/*crea la tabla transacciones*/
CREATE TABLE `AlkeWallet`.`transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `sender_user_id` INT NOT NULL,
  `receiver_user_id` INT NOT NULL,
  `amount` VARCHAR(45) NOT NULL,
  `transaction_date` DATE NOT NULL,
  PRIMARY KEY (`transaction_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

/* Modificamos tabla transactions los senders y receivers a llaves foraneas referenciando a user_id */
ALTER TABLE `AlkeWallet`.`transactions` 
ADD CONSTRAINT `sender_user_id`
  FOREIGN KEY (`sender_user_id`)
  REFERENCES `AlkeWallet`.`users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `receiver_user_id`
  FOREIGN KEY (`receiver_user_id`)
  REFERENCES `AlkeWallet`.`users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*Creamos la tabla money*/
CREATE TABLE `AlkeWallet`.`money` (
  `currency_id` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(45) NOT NULL,
  `currency_symbol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = InnoDB
CHARACTER SET = utf8 ,
COLLATE = utf8_spanish_ci ;

/*Seleccionamos la tabla usuarios para ingresar los datos y al final nos muestra como queda la tabla*/
INSERT INTO `AlkeWallet`.`users` (nombre, email, passwd, balance) VALUES ('César Sánchez', 'cesarinfo10@gmail.com', '1234','90440' );
INSERT INTO `AlkeWallet`.`users` (nombre, email, passwd, balance) VALUES ('Carlos santis', 'csantis@gmail.com', '15666788','35677');
INSERT INTO `AlkeWallet`.`users` (nombre, email, passwd, balance) VALUES ('Diolena rios', 'drios@gmail.com', '12345','$78.000');
SELECT * FROM AlkeWallet.users;

/*Seleccionamos la tabla transacciones para ingresar los datos y al final nos muestra como queda la tabla*/
INSERT INTO `AlkeWallet`.`transactions` (sender_user_id, receiver_user_id, amount, transaction_date) VALUES ('1', '1', '250000', '2020-10-28');
INSERT INTO `AlkeWallet`.`transactions` (sender_user_id, receiver_user_id, amount, transaction_date) VALUES ('2', '1', '450000', '2022-08-15');
INSERT INTO `AlkeWallet`.`transactions` (sender_user_id, receiver_user_id, amount, transaction_date) VALUES ('3', '2', '900000', '2019-04-26');
SELECT * FROM AlkeWallet.transactions;

/*Seleccionamos la tabla money para ingresar los datos y al final nos muestra como queda la tabla*/
INSERT INTO `AlkeWallet`.`money` (currency_name, currency_symbol) VALUES ('Dolar', 'us$');
INSERT INTO `AlkeWallet`.`money` (currency_name, currency_symbol) VALUES ('Euro', '€');
INSERT INTO `AlkeWallet`.`money` (currency_name, currency_symbol) VALUES ('CLP', '$');
SELECT * FROM AlkeWallet.money;

/*Consultas SQL*/
/*Consulta para obtener nombre de la moneda elegida por un usuario especifico(llamamos a usuario 2)*/
USE AlkeWallet;
SELECT money.currency_name, money.currency_symbol, users.user_id
FROM money
INNER JOIN users ON money.currency_id = users.user_id
WHERE user_id = 2;

/*Consulta para obtener todas las transacciones registradas*/
USE AlkeWallet;
SELECT * FROM transactions;

/*Consulta para obtener todas las transacciones realizadas por un
usuario específico (Usuario 3)*/
USE AlkeWallet;
SELECT transactions.transaction_id, transactions.amount, transactions.transaction_date,
users.nombre, users.user_id
FROM transactions
INNER JOIN users ON transactions.transaction_id = users.user_id
WHERE user_id = 3;

/*Sentencia DML para modificar el campo correo electrónico de un
usuario específico(usuario 1 = cesarinfo10@gmail.com* OJO; EJECUTAR LINEA POR LINEA SEPARADOS*/
USE AlkeWallet;
SELECT * FROM users;/*EJECUTAR LINEA 92 Y 93 JUNTAS Y DESPUES EL UPDATE*/
update users
set email ='cesarnuevo@nuevoemail.com'
where user_id=1;
SELECT * FROM users;

/*Sentencia para eliminar los datos de una transacción (eliminado de la fila completa ID TRANSACTION 2)*/
USE AlkeWallet;
SELECT * FROM transactions;
DELETE FROM transactions
where transaction_id=2;
SELECT * FROM transactions;