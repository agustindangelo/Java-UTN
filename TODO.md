## GENERAL
✔ Login (C: paciente, C: nutricionista)

## PACIENTE
✔ Registro (A: paciente)
✔ Buscar nutricionista (C: nutricionista, C: horario, C: direccion, C: localidad)
  ✔ Solicitar nutricionista (A: solicitud)
 ✔ Notificar solicitud aceptada (Email)
* Main paciente:
  ✔ Panel calorías (C: consumo_paciente)
  * Panel peso (MC: paciente)
  * Panel humor (MC: paciente_estado_animo)
  * Panel ejercicio (C: paciente_ejercicio)
    * Modificar ejercicios (ABMC: paciente_ejercicio)
      * Buscar ejercicio (C: ejercicio)
  * Panel dieta de hoy (C: consumo_paciente)
    * Agregar comida (ABMC: consumo_paciente)
      * Buscar alimento (C: alimento, C: plan_alimento, C: categoria)
      * Agregar alimento (A: alimento, C: categoria)
✔ Mi perfil (ABMC: paciente)


## NUTRICIONISTA
 Registro de nutricionista (A: nutricionista)
* Main nutricionista:
  ✔  Panel solicitudes (C: solicitud)
  ✔  Panel mis pacientes (C: nutricionista_paciente)
  * Panel paciente
     ✔ Info del paciente (C: paciente)
     * Editar (CM: paciente, B: nutricionista_paciente)
      * Calorías (C: consumo_paciente)
      * Peso
        * Objetivo (C: paciente)
          * Modificar (M: paciente)
        * Actual (C: paciente)
      * Ejercicios de esta semana (C: ejercicio)
   ✔ Enviar mail al cargar el plan
* Completar perfil paciente (MC: paciente)
 ✔  Mi perfil (ABMC: nutricionista, ABMC: horario, AMC: direccion)