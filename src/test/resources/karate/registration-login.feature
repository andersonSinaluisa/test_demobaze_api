Feature: User Registration and Login Tests

  Background:
    * url  'https://api.demoblaze.com'
    * def responseSuccess = read('classpath:karate/data/response-data-register.json')

  Scenario Outline: Create a new user
    Given path '/signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match response == '#string'
    Examples:
      | username | password |
      | new_user_admin_test21 | 123456 |
      | new_user_admin_test22 | 123456 |


  Scenario Outline: Try to create an existing user
    Given path '/signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
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
    And match response contains "Auth_token"

    Examples:
      | username  | password |
      | andersonstest  | 123456   |
      | anderson2 | 123456   |

  Scenario Outline: Incorrect username and password in login
    Given path '/login'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match response == { errorMessage: '#string'}
    Examples:
      | username  | password |
      | test  | 123456   |
      | test3 | 123456   |
