Feature: JsonPath

  Background:
     * def levels =
  """
  [
    {
      rank : "kyu",
      level : 9,
      beltColor : "white"
    },
    {
      rank : "kyu",
      level : 8,
      beltColor : "yellow"
    },
    {
      rank : "kyu",
      level : 7,
      beltColor : "orange"
    },
    {
      rank : "kyu",
      level : 6,
      beltColor : "green"
    },
    {
      rank : "kyu",
      level : 5,
      beltColor : "blue"
    },
      {
      rank : "kyu",
      level : 4,
      beltColor : "blue"
    },
    {
      rank : "kyu",
      level : 3,
      beltColor : "brown"
    },
    {
      rank : "kyu",
      level : 2,
      beltColor : "brown"
    },
    {
      rank : "kyu",
      level : 1,
      beltColor : "brown"
    },
    {
      rank : "dan",
      level : 1,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 2,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 3,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 4,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 5,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 6,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 7,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 8,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 9,
      beltColor : "black"
    },
    {
      rank : "dan",
      level : 10,
      beltColor : "black"
    },
  ]
  """

  Scenario: Using JsonPath
    * def beltColors = get levels[*].beltColor
    * match beltColors contains ["white", "yellow", "orange", "green", "blue", "brown", "black"]
    * match beltColors !contains ["pink"]

    * def firstColor = get levels[0].beltColor
    * print "First color is", firstColor

  Scenario: Using JsonPath
    * def colors = get levels[0:4].beltColor
    * print "Colors: ", colors

  Scenario: Using JsonPath
    * def colors = get levels[-2:].level
    * print "Levels: ", colors

  Scenario: Using JsonPath to filter only items with level = 1
    * def colors = get levels[?(@.level == 1)]
    * print "Levels: ", colors

  Scenario: Using JsonPath to get nested element
  Given def nested =
  """
  {
    items : [
      { value : "ich" },
      { value : "ni" },
    ], 
    value : "san"
  }
  """
  Then match nested..value contains only ["ich", "ni", "san"]
  