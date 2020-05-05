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
    And request { name: "Shiken Haramitsu Daikoumyo", description : 'To seek a bright future of enlightenment by loving, being true and natural and persevering with dedication' }
    When method POST
    Then status 200
    And match response.description == 'To seek a bright future of enlightenment by loving, being true and natural and persevering with dedication'
    * def noteId = response.id
    * def description = response.description

    Given path '/notes', noteId
    And request { name: "Terry Pratchett, Reaper Man", description : #(textUppercase(description)) }
    When method PUT
    Then status 200
    And match response.description == 'TO SEEK A BRIGHT FUTURE OF ENLIGHTENMENT BY LOVING, BEING TRUE AND NATURAL AND PERSEVERING WITH DEDICATION'



