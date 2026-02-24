Feature: Rooms API

Scenario: Get rooms and validate positive price exists
  Given url baseUrl
  And path 'room'
  When method get
  Then status 200

  # rooms puede venir directo o dentro de una propiedad; lo hacemos robusto
  * def rooms = response.rooms ? response.rooms : response
  And match rooms == '#[]'

  * def hasPositive = rooms.filter(x => x.roomPrice > 0).length > 0
  And match hasPositive == true