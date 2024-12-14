Feature: API de Marvel para consultar personajes, historias y otros

  # Recordar wue el hash es el cifrado en MDS de timestamp + privateKey + publicKey
  # Given/When/Then/And/But
  Background:
    * def baseURL = 'https://gateway.marvel.com'
    * def publicKey = '2ce8bd54540e304d1e52ed255c6097c1'
    * def hashAPI = 'd8fcb8b305410c04c7c76a825ae1d733'
    * def refererURL = 'developer.marvel.com'
      Given url baseURL

  Scenario: Listar personajes de Marvel usando url Reference de Marvel
    And path '/v1/public/characters'
    And param apikey = publicKey
    And header Referer = refererURL
    When method get
    Then status 200
    And print 'El body response es: ', response

  Scenario: Listar personajes de Marvel usando TS, HASH y publicKey
    And path '/v1/public/characters'
    And param apikey = publicKey
    And param ts = '1'
    And param hash = hashAPI
    When method get
    Then status 200
    And print 'El body response es: ', response