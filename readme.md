# TPI 2018

Entrega del trabajo integrador de la materia TTPS opción Ruby.

El trabajo se realizó siguiendo una guía de TDD, que parte del ejercicio de Todo list, y se adaptó a lo pedido en el trabajo. Primero se desarrollaron los tests en Rspec con el comportamiento esperado y luego se iban generando los controladores y modelos.
Los tests que se realizaron fueron request specs

> Request specs are designed to drive behavior through the full stack, including routing. This means they can hit the applications' HTTP endpoints as opposed to controller specs which call methods directly. Since we're building an API application, this is exactly the kind of behavior we want from our tests.

Los mismos se encuentran en specs/requests. Se define un test para que cada request hacia la API chequee por un token válido. El mismo se encuentra en specs/controllers/application_controller_spec.rb

El código para generar datos de test se encuentran en specs/factories

Para la autenticación, se modela al usuario con un atributo password_digest, requerido para autenticarlo contra un password bcrypt.

En app/lib se encuentra la clase que provee jason web tokens

En app/auth se encuentran los servicios que proveen la autenticación del usuario, y el control de que los request tengan un token válido.


## Gemas utilizadas

#### factory_bot_rails

Usada para generar datos de test automáticamente.

#### shoulda_matchers

permite crear test Rspec de manera elegante.

#### faker

librería para generar datos falsos

#### database_cleaner

nos permite limpiar la base antes de cada test

#### bcrypt

permite almacenar contraseñas cifradas

#### jwt

provee autenticación por token (jwt).

## Instalacion

Clone el repositorio git

Instalar todas las dependencias

Crear db y migrar esquemas



```bash


 git clone https://github.com/martynbiz/human_services_finder.git 

 bundle install 

 rake db:create rake db:migrate 


```

## Uso

```bash

rails s #para realizar test manuales

bundle exec rspec #para correr todos los tests con datos generados dinámicamente'
```

