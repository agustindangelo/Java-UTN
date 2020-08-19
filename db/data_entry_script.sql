insert into categoria (nombre) values ('verdura');
insert into categoria (nombre) values ('carne');
insert into categoria (nombre) values ('legumbre');
insert into categoria (nombre) values ('lacteo');
insert into categoria (nombre) values ('fruta');
insert into categoria (nombre) values ('fruto seco');
insert into categoria (nombre) values ('cereal');
insert into categoria (nombre) values ('azucarado');
select * from categoria;

insert into unidad_medida (nombre) values ('gramos');
insert into unidad_medida (nombre) values ('unidades');
insert into unidad_medida (nombre) values ('filetes');
insert into unidad_medida (nombre) values ('puñado');
select * from unidad_medida;

insert into alimento (nombre, calorias, grasas, proteinas, carbohidratos, id_unidad_medida, id_categoria) values ('Carne de vaca', 150, 50, 20, 0, 3, 8);
insert into alimento (nombre, calorias, grasas, proteinas, carbohidratos, id_unidad_medida, id_categoria) values ('Lentejas', 100, 0, 35, 30, 1, 9);
insert into alimento (nombre, calorias, grasas, proteinas, carbohidratos, id_unidad_medida, id_categoria) values ('Queso parmesano', 500, 200, 70, 15, 1, 10);
select * from alimento;

insert into estado_animo (nombre) values ('desanimado');
insert into estado_animo (nombre) values ('energico');
insert into estado_animo (nombre) values ('cansado');
insert into estado_animo (nombre) values ('desmotivado');
insert into estado_animo (nombre) values ('motivado');
select * from estado_animo;

insert into paciente (dni, nombre, apellido, email, password, telefono, genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo)
	values ('11111111', 'agustin', 'dangelo', 'agustin@gmail.com', 'agustin', '12313123', 'masculino', '20000224', 177, 77, 20, 2000, 90, 'subir peso');
insert into paciente (dni, nombre, apellido, email, password, telefono, genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo)
	values ('11111112', 'rodrigo', 'perez', 'rodrigo@gmail.com', 'rodrigo', '7657567567', 'masculino', '20050224', 150, 60, 15, 1800, 55, 'bajar peso');
insert into paciente (dni, nombre, apellido, email, password, telefono, genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo)
	values ('11111113', 'martin', 'moreno', 'martin@gmail.com', 'martin', '556456', 'masculino', '20050130', 165, 57, 12, 2150, 70, 'aumentar masa muscular');
select * from paciente;
    
insert into nutricionista (dni, nombre, apellido, password, email, telefono) values ('22222221', 'laura', 'merlo', 'laura', 'laura@gmail.com', '341 22313222');
insert into nutricionista (dni, nombre, apellido, password, email, telefono) values ('22222222', 'martina', 'moron', 'martina', 'martina@gmail.com','341 4134243');
insert into nutricionista (dni, nombre, apellido, password, email, telefono) values ('22222223', 'juan', 'mendez', 'juan', 'juan@gmail.com', '341 5543445');
select * from nutricionista;

insert into nutricionista_paciente (id_nutricionista, id_paciente, fecha) values ('22222221', '11111111', 20201202);
insert into nutricionista_paciente (id_nutricionista, id_paciente, fecha) values ('22222221', '11111111', 20200815);
insert into nutricionista_paciente (id_nutricionista, id_paciente, fecha) values ('22222222', '11111113', 20200615);
select * from nutricionista_paciente;

insert into solicitud (id_nutricionista, id_paciente, estado) values ('22222221', '11111113', 'confirmada');
insert into solicitud (id_nutricionista, id_paciente, estado) values ('22222222', '11111113', 'pendiente');
insert into solicitud (id_nutricionista, id_paciente, estado) values ('22222222', '11111112', 'rechazada');
insert into solicitud (id_nutricionista, id_paciente, estado) values ('22222223', '11111113', 'confirmada');
insert into solicitud (id_nutricionista, id_paciente, estado) values ('22222223', '11111111', 'pendiente');
insert into solicitud (id_nutricionista, id_paciente, estado) values ('22222222', '11111111', 'rechazada');
select * from solicitud;

insert into ejercicio (nombre, gasto_energetico) values ('correr', 1000);
insert into ejercicio (nombre, gasto_energetico) values ('nado', 1300);
insert into ejercicio (nombre, gasto_energetico) values ('caminata', 500);
insert into ejercicio (nombre, gasto_energetico) values ('pesas', 600);
insert into ejercicio (nombre, gasto_energetico) values ('ciclismo', 400);
insert into ejercicio (nombre, gasto_energetico) values ('tennis', 1000);
select * from ejercicio;

insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111113', 1, curdate(), 30, 'moderada');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111113', 3, curdate(), 50, 'alta');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111113', 4, curdate(), 10, 'baja');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111112', 1, curdate(), 30, 'moderada');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111112', 2, curdate(), 10, 'baja');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111112', 6, curdate(), 10, 'baja');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111111', 5, curdate(), 30, 'moderada');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111111', 3, curdate(), 50, 'alta');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha, duracion, intensidad) values ('11111111', 4, curdate(), 10, 'baja');
select * from paciente_ejercicio;

insert into plan (id_paciente, id_nutricionista, fecha_desde) values ('11111111', '22222221', curdate());
insert into plan (id_paciente, id_nutricionista, fecha_desde) values ('11111112', '22222222', curdate());
insert into plan (id_paciente, id_nutricionista, fecha_desde) values ('11111113', '22222223', curdate());
select * from plan;

insert into plan_alimento (id_plan, id_alimento) values (1, 1);
insert into plan_alimento (id_plan, id_alimento) values (1, 2);
insert into plan_alimento (id_plan, id_alimento) values (2, 1);
insert into plan_alimento (id_plan, id_alimento) values (2, 3);
insert into plan_alimento (id_plan, id_alimento) values (3, 3);
select * from plan_alimento;

insert into paciente_estado_animo (id_paciente, id_estado_animo, fecha) values ('11111111', 4, curdate());
insert into paciente_estado_animo (id_paciente, id_estado_animo, fecha) values ('11111111', 3, curdate());
insert into paciente_estado_animo (id_paciente, id_estado_animo, fecha) values ('11111112', 1, curdate());
select * from paciente_estado_animo;

insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'martes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'martes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'miercoles', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'miercoles', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'miercoles', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'miercoles', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'jueves', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'jueves', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'jueves', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222221', 'jueves', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'martes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'martes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'miercoles', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'miercoles', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'miercoles', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'miercoles', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'lunes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'lunes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'lunes', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'lunes', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222222', 'martes', 170000, 173000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'martes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'miercoles', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'miercoles', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'miercoles', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'miercoles', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'viernes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'viernes', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('22222223', 'viernes', 100000, 103000);
select * from horario;

insert into localidad (cod_postal, denominacion) values (2000, 'Rosario');
insert into localidad (cod_postal, denominacion) values (2113, 'Peyrano');
select * from localidad;

insert into direccion (cod_postal, altura, calle, id_nutricionista) values (2000, 1300, 'Zeballos', '22222221');
insert into direccion (cod_postal, altura, calle, id_nutricionista) values (2113, 200, 'Av. San Martin', '22222222');
insert into direccion (cod_postal, altura, calle, id_nutricionista) values (2000, 2213, 'Corrientes', '22222223');
select * from direccion;

insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111111', 1, curdate(), 'merienda', 3);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111111', 2, curdate(), 'almuerzo', 200);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111111', 2, curdate(), 'desayuno', 500);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111112', 3, curdate(), 'almuerzo', 50);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111112', 1, curdate(), 'cena', 2);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111113', 1, curdate(), 'otro', 5);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values ('11111113', 1, curdate(), 'almuerzo', 5);
select * from consumo_paciente;

select * from unidad_medida;
select * from categoria;
insert into categoria (nombre) values ('');
select * from consumo_paciente;
update categoria set nombre='azucarado' where id_categoria=14;