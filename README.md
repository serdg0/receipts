# Importing Tab Sheets to a DB

> Proyecto para importar datos de una hoja tabulada a una base de datos relaciones en Ruby on Rails.

Esta aplicación muestra la cantidad total de dinero que ha percibido un usuario, en base a objetos `Receipt`.

Cada vez que alguien ingresa datos, estos se suman al `total_income` del usuario, y se muestra en la aplicación.
## Built With

- Ruby
- Ruby on Rails
- postgresql
- devise para autenticación.
- roo para importar hojas tabuladas.
- Rspec, Shoulda-Matchers y Capybara para los tests.

## Empezando

### Setup
Clona el repositorio, y da `bundle install` en el root del mismo.

Después, da `rails s` en el root del mismo.

En tu navegador visita `http://localhost:3000/`

### Uso
Registrate con cualquier correo y password, luego entra a tu cuenta, y empieza a importar hojas tabuladas.
### Tests
En el root da `bundle exec rspec`

