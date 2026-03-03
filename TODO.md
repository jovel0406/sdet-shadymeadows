# SDET SDET Technical Challenge: Shady Meadows B&B

## Definition of Done
 - [ x] API automation implemented with Karate. 
 - [ x] UI automation implemented with Playwright (Home + admin flows).
 - [ x] Clear README with SETUP + how to run tests (AP/UI).
 - [x ] Reports generatad and instruction to view them (Karate + Playwright).
 - [ x] Tests are atomic / self-contained (no reliance on existing data).
 - [ x] Clean proyect structure.
 - [ x] Notes on findings/bugs/observation.
 - [ x] (Optional) CI/CD proposal (e.g , GitHub Actions).

 ## API Automation (Karate)
 - [ x] Create Karate DLS proyect with Maven.
 - [ x] GET / branding/ -> assert name == "Shady Meadows B&B" and email matches regex.
 - [ x] GET / room/ -> assert response is an array and at least one room has roomPrice > 0
 - [ x] POST / booking/ -> create booking using a dynamic roomid retrieved from /room
 - [ x] Karate report

 ## UI Automation (Playwright)
 - [ x] Create a proyect Playwright.
 - [ x] Home: Contact form is visible.
 - [ x] Home: "Book this room" buttons are present. 
 - [ x] Admin: Admin login with admin and password 
 - [ x] Admin: redirect to dashboard/inbox and Logout button visible.
 - [ x] Compare a room detail betwen home and admin/rooms.
 - [ x] The Playwright HTML report is gereraret.

## Delivery (README + quality)
- [ ] README: prerequisites, installation, and commands to run API/UI tests
- [ ] README: where reports are located and how to open them.
- [ ] README: key design decisions (brief).
- [ ] Findings/bugs/observations documented.
- [ ] CI/CD approach documented  