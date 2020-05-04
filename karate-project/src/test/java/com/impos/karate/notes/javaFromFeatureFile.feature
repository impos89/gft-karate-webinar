Feature: Expected to be able to run java code in scenarios

  Background:
    * url host
    * def base64 = Java.type('com.impos.utils.Base64Encoder');

  Scenario: Call /notes endpoints with wrong credentials should throw error
    * def encodedAuthorization = base64.encode("wrongUsername", ":", "WrongPassword")
    Given path '/notes'
    And header Authorization = "Basic " + encodedAuthorization
    When method GET
    Then status 401
    And match response == {"message":"Invalid Authentication Credentials"}