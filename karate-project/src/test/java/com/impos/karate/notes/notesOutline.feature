Feature: All notes endpoints are authenticated

  Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario Outline: Successful create multiple notes
    * def payload =  { name: <name>, description: <description> }

    Given path '/notes'
    And request payload
    When method POST
    Then status 200
    And match response contains { id: '#notnull' }

    Examples:
      | name  | description |
      | name1 | desc1       |
      | name2 | desc2       |
      | name3 | desc3       |
      | name4 | desc4       |
