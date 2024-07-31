# PROYECTO AIRPORTART

Este proyecto es una aplicación para gestionar aeropuertos y operadores, utilizando una arquitectura de front end en Nuxt.js y back end en Node.js con NestJS.

## Iniciar Servidores

Para iniciar todos los servicios definidos en el archivo `docker-compose.yml`, sigue los siguientes pasos:

1. Ejecuta el siguiente comando:
~~~
   docker-compose up -d
~~~


Esto iniciará los contenedores para MySQL, Directus, phpMyAdmin, y Flyway.

## Instalación del Front End

1. Navega al directorio del front end:
   cd airportart-web
2. Instala las dependencias necesarias con npm:
~~~
   npm install
~~~

3. Inicia el servidor de desarrollo:
~~~
   npm run dev
~~~


El front end estará disponible en http://localhost:3200.

## Archivo .env de Airportart-Web

Asegúrate de crear un archivo `.env` en el directorio del front end con las siguientes variables:

~~~
VITE_NEST_BACKEND="http://localhost:3000/"

VITE_DIRECTUS_BACKEND="http://localhost:8055/"

PORT=3200

~~~


## Instalación del Back End

1. Navega al directorio del back end:
   cd airportart-api
2. Instala las dependencias necesarias con npm:
~~~
  npm install   
~~~

3. Inicia el servidor de desarrollo:
~~~
   npm run start:dev
~~~


El back end estará disponible en http://localhost:3000.

## Archivo .env de Airportart-API

Asegúrate de crear un archivo `.env` en el directorio del back end con las siguientes variables:

~~~
SERVER_PORT="3000"

CORS_ALLOWED_HEADERS="*"

CORS_ALLOWED_ORIGIN="*"

DIRECTUS_API_URL="http://localhost:8055"

~~~

## Problemas frecuentes

Si al intentar acceder a las colecciones de Directus obtienes un error 404 Forbidden desde su plataforma, sigue estos pasos para resolver el problema:

1. Reinicia el contenedor de docker desde Docker Desktop.

O también puedes hacerlo desde los comandos de docker, el cual sería:
~~~
docker-compose up directus
~~~


