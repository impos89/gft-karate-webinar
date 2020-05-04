Feature: Expected to be able to run js in scenarios

  Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

  Scenario: js
    * def textUppercase =
  """
    function(text) {
        return text.toUpperCase();
    }
  """

    Given path '/notes'
    And request { name: "Terry Pratchett, Reaper Man", description : "Five exclamation marks, the sure sign of an insane mind." }
    When method POST
    Then status 200
    And match response.description == "Five exclamation marks, the sure sign of an insane mind."
    * def noteId = response.id
    * def description = response.description

    Given path '/notes', noteId
    And request { name: "Terry Pratchett, Reaper Man", description : #(textUppercase(description)) }
    When method PUT
    Then status 200
    And match response.description == "FIVE EXCLAMATION MARKS, THE SURE SIGN OF AN INSANE MIND."



