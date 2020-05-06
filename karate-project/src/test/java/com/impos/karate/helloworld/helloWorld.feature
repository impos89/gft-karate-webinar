Feature: Hello World

  Background:
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario: Create new Note and then get it
    * def body =
    """
    {
      "name" : "Add Nyan Cat plugin to Intellij",
      "description" : "I found a fancy nyan cat plugin to be so cool"
    }
    """

    Given url 'http://127.0.0.1:3000/notes'
    And request body
    When method POST
    Then status 200
    And match response contains { id: '#notnull' }
    And match response.name == "Add Nyan Cat plugin to Intellij"

    * def id = response.id

    Given url 'http://127.0.0.1:3000/notes/' + id
    When method GET
    Then status 200