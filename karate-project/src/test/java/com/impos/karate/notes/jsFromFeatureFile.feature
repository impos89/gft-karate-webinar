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
    And request { name: "Oss", description : 'Push On Through Difficulties' }
    When method POST
    Then status 200
    And match response.description == 'Push On Through Difficulties'

    Given path '/notes', response.id
    And request { name: #(textUppercase(response.name)), description : #(response.description) }
    When method PUT
    Then status 200
    And match response.name == 'OSS'



