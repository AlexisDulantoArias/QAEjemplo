Feature: MarvelAPI

  Scenario Outline: Obtener lista de personajes
  Given url "https://gateway.marvel.com"
    And path "/v1/public/characters"
    And param apikey = "<apikey>"
    And header Referer = "<referer>"
    When method get
    Then status 200
    Examples:
      | apikey                           | referer              |
      | 2ce8bd54540e304d1e52ed255c6097c1 | developer.marvel.com |