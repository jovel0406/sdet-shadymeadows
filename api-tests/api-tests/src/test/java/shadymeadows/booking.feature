Feature: Booking API

Scenario: Create booking using a dynamic roomid
  # 1) Obtener roomid válido
  Given url baseUrl
  And path 'room'
  When method get
  Then status 200
  * def rooms = response.rooms ? response.rooms : response
  * def roomId = rooms[0].roomid

  # 2) Crear booking (según lo que confirmaste en Postman)
  Given url baseUrl
  And path 'booking'
  And request
    """
    {
      "roomid": #(roomId),
      "firstname": "Jose",
      "lastname": "Jovel",
      "depositpaid": true,
      "bookingdates": {
        "checkin": "2026-03-01T00:00:00.000Z",
        "checkout": "2026-03-05T00:00:00.000Z"
      },
      "totalprice": 100
    }
    """
  When method post
  Then status 201

  And match response.bookingid == '#number'
  And match response.roomid == roomId