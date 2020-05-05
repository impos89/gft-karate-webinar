Feature: Functional operations

  Scenario: Using map()
    * def fun = function(x){ return x.level + " " + x.rank + ", " + x.beltColor + " belt" }
    * def file = read('levels.json')

    * def levels =  get file
    * def fullInfo = karate.map(levels, fun)
    * print "Mapped value","[", fullInfo[2],"]"

  Scenario: Using filter()
    * def highLevelsOnly = function(x){ return x.level > 8 }
    * def file = read('levels.json')
    * def levels =  get file

    * print "Filtered values", karate.filter(levels, highLevelsOnly)

  Scenario: Using foreach()
    * def printHighLevelsOnly = function(rank){ if(rank.level > 8) print( rank ) }
    * def file = read('levels.json')

    * def levels =  get file

    * karate.forEach(levels, printHighLevelsOnly)

    Scenario: filterKeys
    * def schema = { rank: '#string', level: '#number', beltColor: '#string', graduated: '#present'}
    * def response = {"rank":"kyu", "level": 9, beltColor: 'white' }

    * print karate.filterKeys(schema, response)
    * match response == karate.filterKeys(schema, response)

    Scenario: merge
    * def zazen = 
    """
    { 
      'Seiza' : 'Kneel',
      'Mokuso HAJIME' : 'Begin meditation',
      'Mokuso Yame' : 'End of Meditation',
    }
    """
    * def rei = { 'Sensei ni rei' : 'Respect to sensei', 'Otagai ni rei' : 'Respect to each other’s' }
    * print karate.merge(zazen, rei)




  