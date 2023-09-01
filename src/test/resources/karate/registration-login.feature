Feature: Pruebas de Registro y Login de Usuarios

  Background:
    * url  'https://api.demoblaze.com'
    * def users = read('classpath:karate/data/users.csv')

  Scenario: Crear un nuevo usuario en signup
    Given path '/signup'
    And request { username: '#(users.username[0])', password: '#(users.password[0])' }
    When method post
    Then status 201
    And match response == { message: 'Usuario creado exitosamente' }

  Scenario: Intentar crear un usuario ya existente
    Given path '/signup'
    And request { username: '#(users.username[1])', password: '#(users.password[1])' }
    When method post
    Then status 400
    And match response == { message: 'El usuario ya existe' }

  Scenario: Usuario y contraseña correctos en login
    Given path '/login'
    And request { username: '#(users.username[2])', password: '#(users.password[2])' }
    When method post
    Then status 200
    And match response == { message: 'Inicio de sesión exitoso' }

  Scenario: Usuario y contraseña incorrectos en login
    Given path '/login'
    And request { username: '#(users.username[3])', password: '#(users.password[3])' }
    When method post
    Then status 401
    And match response == { message: 'Credenciales incorrectas' }