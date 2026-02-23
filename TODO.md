# SDET SDET Technical Challenge: Shady Meadows B&B

## Definition of Done
 - [ ] API automation implemented with Karate. 
 - [ ] UI automation implemented with Playwright (Home + admin flows).
 - [ ] Clear README with SETUP + how to run tests (AP/UI).
 - [ ] Reports generatad and instruction to view them (Karate + Playwright).
 - [ ] Tests are atomic / self-contained (no reliance on existing data).
 - [ ] Clean proyect structure.
 - [ ] Notes on findings/bugs/observation.
 - [ ] (Optional) CI/CD proposal (e.g , GitHub Actions).

 ## API Automation (Karate)
 - [ ] Create Karate DLS proyect with Maven.
 - [ ] GET / branding/ -> assert name == "Shady Meadows B&B" and email matches regex.
 - [ ] GET / room/ -> assert response is an array and at least one room has roomPrice > 0
 - [ ] POST / booking/ -> create booking using a dynamic roomid retrieved from /room
 - [ ] Karate report

 ## UI Automation (Playwright)
 - [ ] Create a proyect Playwright.
 - [ ] Home: Contact form is visible.
 - [ ] Home: "Book this room" buttons are present. 
 - [ ] Admin: Admin login with admin and password 
 - [ ] Admin: redirect to dashboard/inbox and Logout button visible.
 - [ ] Compare a room detail betwen home and admin/rooms.
 - [ ] The Playwright HTML report is gereraret.

## Delivery (README + quality)
- [ ] README: prerequisites, installation, and commands to run API/UI tests
- [ ] README: where reports are located and how to open them.
- [ ] README: key design decisions (brief).
- [ ] Findings/bugs/observations documented.
- [ ] CI/CD approach documented  