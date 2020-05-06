Feature: Reuse existing script to create note and then
    Background:
        * url host
        * configure headers = { 'Authorization' : 'Basic c29tZTNkdWNrczppbnRoZXpvbw==' }

    Scenario: reuse feature
        * def note = call read('createNoteUtil.feature') { name: 'Reused', description : 'Scenario' }
        * match note.response.id == '#number'
        * def noteId = note.response.id

        Given path 'notes', noteId
        When method GET
        Then status 200
        And match response == { id: '#number', name: 'Reused', description : 'Scenario', links:'#ignore'}
