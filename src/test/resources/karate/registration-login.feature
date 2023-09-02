Feature: User Registration and Login Tests

  Background:
    * url  'https://api.demoblaze.com'
    * def responseSuccess = read('classpath:karate/data/response-data-register.json')

  Scenario Outline: Create a new user
    Given path '/signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 201
    And match response === { "message": "#string" }
    Examples:
      | username | password |
      | anderson2336 | 123456 |
      | anderson23856 | 123456 |


  Scenario Outline: Try to create an existing user
    Given path '/signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 400
    And match response == { errorMessage: 'This user already exist.' }
    Examples:
      | username  | password |
      | anderson  | 123456   |
      | anderson2 | 123456   |

  Scenario Outline: Correct username and password in login
    Given path '/login'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match response == { "Auth_token": "#string" }

    Examples:
      | username  | password |
      | anderson  | 123456   |
      | anderson2 | 123456   |

  Scenario Outline: Incorrect username and password in login
    Given path '/login'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 401
    And match response == { errorMessage: '#string' }
    Examples:
      | username  | password |
      | test  | 123456   |
      | test3 | 123456   |
