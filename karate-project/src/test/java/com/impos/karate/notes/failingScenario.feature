Feature: Examining functionality of Notes application to ensure they can be stored, updated retrieved and deleted

  Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario: Create Note
    * def payload =
    """
    {
      name : "6 Kyu",
      description : "Green belt represents that a very basic steps of karate learning have been accomplished successfully.",
      label : "green"
    }
    """
    Given path '/notes'
    And request payload
    When method POST
    Then status 200
    And def noteId = get response.id

    Given path 'notes', noteId
    When method GET
    Then status 200
    And match response contains
    """
    {
      id : #(noteId),
        name : "6 Kyu",
        description : "Green belt represents that a very basic steps of karate learning have been accomplished successfully.",
        label : "green",
        links : "#present"
    }
    """

    * def payload =
    """
    {
      name : "1 Dan",
      description : "Seek to gain deeper and complete understanding of physical and mental teaching of karate.",
      label : "black"
    }
    """
    Given path '/notes'
    And request payload
    When method POST
    Then status 200
    And def noteId = get response.id





















