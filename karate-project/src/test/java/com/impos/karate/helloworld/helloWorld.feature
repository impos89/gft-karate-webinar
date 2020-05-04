Feature: Hello World

  Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario: Create new Note
    * def payload =
    """
    {
      "name" : "Add Nyan Cat plugin to idea",
      "description" : "I found a fancy nyan cat plugin to be so cool"
    }
    """
    Given path '/notes'
    And request payload
    When method POST
    Then status 200
    And match response contains { id: '#notnull' }

    * def id = response.id

    Given path '/notes', id
    When method GET
    Then status 200






