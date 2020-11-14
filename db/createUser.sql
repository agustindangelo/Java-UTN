 
create user 'java'@'localhost' identified by 'himitsu';
GRANT SELECT, INSERT, UPDATE, DELETE ON `nutricionista`.* TO 'java'@'localhost';

Tienen que tener una conexion creada en la bd con el nombre "java", si no, tira NullPointerException en el conector