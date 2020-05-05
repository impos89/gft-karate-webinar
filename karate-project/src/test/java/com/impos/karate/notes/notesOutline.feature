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
      | name       | description                                                       |
      | Oss        | Push On Through Difficulties. kind of respectful catch-all phrase |
      | Hajime     | Begin/Start                                                       |
      | Watashi    | I (Me)                                                            |
      | Seiza Waza | Kneeling Techniques                                               |
      | Dojo       | School                                                            |
