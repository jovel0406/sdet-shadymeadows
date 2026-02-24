Feature: Branding API

Scenario: Get branding details
  Given url baseUrl
  And path 'branding'
  When method get
  Then status 200

  And match response.name == 'Shady Meadows B&B'
  And match response.contact.email == '#regex ^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$'