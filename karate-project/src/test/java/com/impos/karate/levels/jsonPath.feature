Feature: JsonPath

  Scenario: Using JsonPath

    * def levels =
  """
  [
  {
    rank : "kyu",
    level : "9",
    beltColor : "white"
  },
  {
    rank : "kyu",
    level : "8",
    beltColor : "yellow"
  },
  {
    rank : "kyu",
    level : "7",
    beltColor : "orange"
  },
  {
    rank : "kyu",
    level : "6",
    beltColor : "green"
  },
  {
    rank : "kyu",
    level : "5",
    beltColor : "blue"
  },
    {
    rank : "kyu",
    level : "4",
    beltColor : "blue"
  },
  {
    rank : "kyu",
    level : "3",
    beltColor : "brown"
  },
  {
    rank : "kyu",
    level : "2",
    beltColor : "brown"
  },
  {
    rank : "kyu",
    level : "1",
    beltColor : "brown"
  },
  {
    rank : "dan",
    level : "1",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "2",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "3",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "4",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "5",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "6",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "7",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "8",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "9",
    beltColor : "black"
  },
  {
    rank : "dan",
    level : "10",
    beltColor : "black"
  },

  ]
  """
    * def beltColors = get levels[*].beltColor
    * match beltColors contains ["white", "yellow", "orange", "green", "blue", "brown", "black"]
    * match beltColors !contains ["pink"]

    * def firstColor = get levels[0].beltColor
    * print "First color is", firstColor


