# Resolución Ejercicio 03: Biblioteca Tech

* **Nombre completo:** Edgar Manolo Polanco Sánchez
* **Fecha:** 21 de Agosto de 2026
* **SGBD:** SQLite 3

---

## 1. Descripción Corta del Problema

El proyecto implementa la base de datos relacional **Biblioteca Tech** en SQLite para automatizar el préstamo, seguimiento y devolución de material bibliográfico técnico. Reemplaza el control manual por un modelo estructurado que garantiza la integridad referencial, evita préstamos a usuarios sin registro e identifica morosidades mediante estados en tiempo real.

---

## 2. Explicación de Tablas y Relaciones

El modelo consta de **4 tablas relacionales**:

1. **`autores` (Catálogo Principal):** Mantiene el registro de los autores de libros técnicos.
2. **`campers` (Catálogo Principal):** Almacena la información de los estudiantes/campers con acceso a préstamos.
3. **`libros` (Catálogo de Material):** Registra las obras disponibles, su ISBN, año de edición y stock de ejemplares.
   * *Relaciones:* `autor_id` $\rightarrow$ `autores(autor_id)`.
4. **`prestamos` (Transaccional Central):** Gestiona el ciclo de vida de los préstamos vinculando el libro, el camper, las fechas programadas/reales de entrega y el estado.
   * *Relaciones:* `libro_id` $\rightarrow$ `libros(libro_id)` y `camper_id` $\rightarrow$ `campers(camper_id)`.

---

## 3. Restricciones Aplicadas

* **Integridad Referencial:** Habilitación explícita con `PRAGMA foreign_keys = ON;`.
* **Claves Primarias:** Asignación de `PRIMARY KEY AUTOINCREMENT` en todas las entidades.
* **Restricción `UNIQUE`:**
  * `autores.correo` y `campers.correo`: Evita cuentas duplicadas.
  * `libros.isbn`: Garantiza la unicidad del estándar internacional del libro.
* **Restricciones `CHECK`:**
  * `libros.anio_publicacion`: Validado entre 1900 y 2026.
  * `libros.ejemplares_disponibles`: Control de inventario en positivo (`>= 0`).
  * `campers.estado`: Acotado a `'Activo'`, `'Suspendido'` o `'Inactivo'`.
  * `prestamos.estado`: Restringido a `'Prestado'`, `'Devuelto'` o `'Atrasado'`.

---

## 4. Estructura de Entregables

```text
resoluciones/polanco-edgar/ejercicio-03/
├── README.md
├── diagramas/
│   └── diagrama-er.png
├── ddl/
│   └── schema.sql
├── dml/
│   ├── inserts.sql
│   └── operaciones.sql
└── dql/
    └── consultas.sql