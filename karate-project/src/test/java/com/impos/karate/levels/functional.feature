Feature: Functional operations

  Scenario: Using map()
    * def fun = function(x){ return x.level + " " + x.rank + ", " + x.beltColor + " belt" }
    * def file = read('levels.json')

    * def levels =  get file
    * def fullInfo = karate.map(levels, fun)
    * print "Mapped value","[", fullInfo[2],"]"

  Scenario: Using filter()
    * def fun = function(x){ return x.level > 8 }
    * def file = read('levels.json')

    * def levels =  get file

    * print "Filtered values", karate.filter(levels, fun)

  Scenario: Using foreach()
  #TODO
