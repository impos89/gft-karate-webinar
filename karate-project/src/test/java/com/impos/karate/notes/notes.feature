Feature: Examining functionality of Notes application to ensure they can be stored, updated retrieved and deleted

  Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario: Successful Nota create
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

  Scenario: Successful Nota create returns saved information
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
    # available markers #ignore, #null, #notnull, #present, #notpresent, #array, #object, #boolean, #number, #string, #uuid
    And match response contains { id: '#notnull' }
    And match response contains { id: '#number' }
    # regex match
    And match response contains { name: '#regex .{27}' }

    # we can check partially content of response ...
    And match response contains {  "name" : "Add Nyan Cat plugin to idea" }
    And match response contains {  "description" : "I found a fancy nyan cat plugin to be so cool" }

    # ... or entire body
    And match response ==
    """
      {
        "id" : "#notnull",
        "name" : "Add Nyan Cat plugin to idea",
        "description" : "I found a fancy nyan cat plugin to be so cool",
        "links" : "#present"
      }
    """

  Scenario: Successfully get existing note
    * def payload =
    """
    {
      "name" : "Buy toilet paper",
      "description" : "Don't forget to take entire stock!"
    }
    """
    Given path '/notes'
    And request payload
    When method POST
    Then status 200
    And match response contains { id: '#notnull' }
    # We can assign a value to property - karate use json path :)
    And def noteId = get response.id
    * print 'Id of new note is:', noteId
    
    Given path 'notes', noteId
    When method GET
    Then status 200
    # inline json
    And match response contains { id : #(noteId), name : "Buy toilet paper", "description" : "Don't forget to take entire stock!", "links" : "#present" }

  Scenario: Should not found non existing note
    Given path '/notes/9999999099'
    When method GET
    Then status 404


















