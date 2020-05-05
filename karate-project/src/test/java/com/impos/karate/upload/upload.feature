Feature: Upload picture

Background:
    * url host
    * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

Scenario: Sending file to server
    Given path 'notes', 'attachment'
    And request read('karate-logo.svg')
    When method post
    Then status 200