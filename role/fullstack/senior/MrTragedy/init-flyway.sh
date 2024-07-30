#!/bin/bash

# Crear la tabla de historial de esquemas (si no existe)
flyway baseline

# Ejecutar las migraciones de Flyway
flyway migrate
