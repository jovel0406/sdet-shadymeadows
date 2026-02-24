Feature: Booking API

Scenario: Create booking (atomic, no helper)

  # 1) Obtener un roomid válido
  Given url baseUrl
  And path 'room'
  When method get
  Then status 200
  * def rooms = response.rooms ? response.rooms : response
  * def roomId = rooms[0].roomid

  # 2) Fechas dinámicas para reducir 409 (conflictos)
  * def LocalDate = Java.type('java.time.LocalDate')
  * def base = LocalDate.now().plusDays(60)
  * def checkin = base.toString() + 'T00:00:00.000Z'
  * def checkout = base.plusDays(2).toString() + 'T00:00:00.000Z'

  # 3) Crear booking
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
        "checkin": #(checkin),
        "checkout": #(checkout)
      },
      "totalprice": 100
    }
    """
  When method post
  Then status 201
  And match response.bookingid == '#number'