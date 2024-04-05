/*Crea BD Alke_Wallet*/
CREATE SCHEMA `Alke__Wallet` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;

/*Crea tabla usuarios*/
CREATE TABLE `Alke__Wallet`.`users` (
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
CREATE TABLE `Alke__Wallet`.`transactions` (
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
ALTER TABLE `Alke__Wallet`.`transactions` 
ADD CONSTRAINT `sender_user_id`
  FOREIGN KEY (`sender_user_id`)
  REFERENCES `Alke__Wallet`.`users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `receiver_user_id`
  FOREIGN KEY (`receiver_user_id`)
  REFERENCES `Alke__Wallet`.`users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*Creamos la tabla money*/
CREATE TABLE `Alke__Wallet`.`money` (
  `currency_id` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(45) NOT NULL,
  `currency_symbol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = InnoDB
CHARACTER SET = utf8 ,
COLLATE = utf8_spanish_ci ;

/*Seleccionamos la tabla usuarios para ingresar los datos y al final nos muestra como queda la tabla*/
INSERT INTO `Alke__Wallet`.`users` (nombre, email, passwd, balance) VALUES ('Cesar Maldonado', 'cmaldonado@yahoo.com', '1234','90440' );
INSERT INTO `Alke__Wallet`.`users` (nombre, email, passwd, balance) VALUES ('Carlos santis', 'csantis@gmail.com', '15666788','35677');
INSERT INTO `Alke__Wallet`.`users` (nombre, email, passwd, balance) VALUES ('Diolena rios', 'drios@gmail.com', '12345','$78.000');
SELECT * FROM Alke__Wallet.users;

/*Seleccionamos la tabla transacciones para ingresar los datos y al final nos muestra como queda la tabla*/
INSERT INTO `Alke__Wallet`.`transactions` (sender_user_id, receiver_user_id, amount, transaction_date) VALUES ('1', '1', '550000', '2022-10-08');
INSERT INTO `Alke__Wallet`.`transactions` (sender_user_id, receiver_user_id, amount, transaction_date) VALUES ('2', '1', '650000', '2023-05-10');
INSERT INTO `Alke__Wallet`.`transactions` (sender_user_id, receiver_user_id, amount, transaction_date) VALUES ('3', '2', '780000', '2020-07-06');
SELECT * FROM Alke__Wallet.transactions;

/*Seleccionamos la tabla money para ingresar los datos y al final nos muestra como queda la tabla*/
INSERT INTO `Alke__Wallet`.`money` (currency_name, currency_symbol) VALUES ('Dolar', 'us$');
INSERT INTO `Alke__Wallet`.`money` (currency_name, currency_symbol) VALUES ('Euro', '€');
INSERT INTO `Alke__Wallet`.`money` (currency_name, currency_symbol) VALUES ('CLP', '$');
SELECT * FROM Alke__Wallet.money;

/*Consultas SQL*/
/*Consulta para obtener nombre de la moneda elegida por un usuario especifico(llamamos a usuario 2)*/
USE Alke__Wallet;
SELECT money.currency_name, money.currency_symbol, users.user_id
FROM money
INNER JOIN users ON money.currency_id = users.user_id
WHERE user_id = 2;

/*Consulta para obtener todas las transacciones registradas*/
USE Alke__Wallet;
SELECT * FROM transactions;

/*Consulta para obtener todas las transacciones realizadas por un
usuario específico (Usuario 2)*/
USE Alke__Wallet;
SELECT transactions.transaction_id, transactions.amount, transactions.transaction_date,
users.nombre, users.user_id
FROM transactions
INNER JOIN users ON transactions.transaction_id = users.user_id
WHERE user_id = 2;

/*Sentencia DML para modificar el campo correo electrónico de un
usuario específico(usuario 1 = cmaldonado@yahoo.com* OJO; EJECUTAR LINEA POR LINEA SEPARADOS*/
USE Alke__Wallet;
SELECT * FROM users;/*EJECUTAR LINEA 92 Y 93 JUNTAS Y DESPUES EL UPDATE*/
update users
set email ='cmaldonado@gmail.com'
where user_id=1;
SELECT * FROM users;

/*Sentencia para eliminar los datos de una transacción (eliminado de la fila completa ID TRANSACTION 3)*/
USE Alke__Wallet;
SELECT * FROM transactions;
DELETE FROM transactions
where transaction_id=3;
SELECT * FROM transactions;