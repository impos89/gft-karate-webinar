Feature: Creating Note for further reuse

  Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario: Successful Nota create
    * def payload =
    """
    {
      "name" : "#(name)",
      "description" : "#(description)"
    }
    """
    Given path '/notes'
    And request payload
    When method POST
    Then status 200
    And match response contains { id: '#notnull' }