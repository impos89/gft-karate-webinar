Feature: All notes endpoints are authenticated
  Background:
    * url host
    * def base64 = Java.type('com.impos.utils.Base64Encoder');

  Scenario: Call /notes endpoints should throw error when header is missing
    * def expectedResponseBody = {"message":"Missing Authorization Header"}

    Given path '/notes'
    When method GET
    Then status 401
    And match response == expectedResponseBody

    Given path '/notes'
    And request {}
    When method POST
    Then status 401
    And match response == expectedResponseBody

    Given path '/notes/1'
    And request {}
    When method PUT
    Then status 401
    And match response == expectedResponseBody

    Given path '/notes/1'
    When method GET
    Then status 401
    And match response == expectedResponseBody

    Given path '/notes/1'
    When method DELETE
    Then status 401
    And match response == expectedResponseBody

  Scenario: Call /notes endpoints with wrong credentials should throw error
    * def encodedAuthorization = base64.encode("wrongUsername", ":", "WrongPassword")
    Given path '/notes'
    And header Authorization = "Basic " + encodedAuthorization
    When method GET
    Then status 401
    And match response == {"message":"Invalid Authentication Credentials"}


