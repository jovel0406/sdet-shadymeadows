# SDET Technical Challenge — Shady Meadows B&B

H-E-L-L-O W-O-R-L-D! 👋  
# SDET Technical Challenge — Shady Meadows B&B

This repository contains my solution to the **SDET Technical Challenge: Shady Meadows B&B**, covering:

- **API automation** with **Karate DSL** (Java + Maven)
- **UI automation** with **Playwright** (Node.js)

The repo is structured to be **clean, reproducible, and easy to run**, including instructions for generating and viewing reports.

---

## 1) Repository Structure

This repo is organized by test layer to keep responsibilities clear:

- `api-tests/`
  - `api-tests/` → Maven module that runs Karate tests (branding, rooms, booking)
- `ui-tests/`
  - Playwright project with UI tests (Home sanity + Admin login)
- `TODO.md` → checklist / plan of execution
- `.gitignore` → excludes generated artifacts (e.g., `target/`, `node_modules/`, reports)
- `README.md` → instructions + approach + findings + CI/CD note

---

## 2) Approach

### 2.1 API Testing (Karate DSL)

#### Endpoints Covered
- `GET /api/branding/`
- `GET /api/room/`
- `POST /api/booking/`

#### Atomic State Management (Important)
The platform resets periodically, so tests are designed to be **atomic**:

- The booking test **does not rely on old data**
- It obtains a valid `roomid` by calling `GET /api/room/` in the same flow
- Booking dates are generated dynamically (future dates) to reduce collisions in a shared sandbox

#### Assertions (what is validated)
- **Branding**: expected properties exist and have valid shapes (e.g., `contact.email`)
- **Rooms**: response has rooms and at least one has a positive price (`roomPrice > 0`)
- **Booking**: creation returns **201** and includes a numeric `bookingid`

---

### 2.2 UI Testing (Playwright)

#### Flows Covered
- **Home sanity**
  - “Contact” section is visible
  - at least one “Book this room” button exists
- **Admin login**
  - navigate to `/admin`
  - login with `admin / password`
  - confirm successful login by asserting “Logout” is visible

#### Selector Strategy (Important)
The admin panel uses modern React components, so I prioritized **user-facing locators** to avoid brittle selectors:

- `getByRole(...)`
- `getByText(...)`
- `getByPlaceholder(...)`

This reduces flakiness and makes tests more maintainable.

---

## 3) Prerequisites

- **Java (JDK)** + **Maven**
- **Node.js** + **npm**
- Internet access (tests hit a public sandbox)

---

## 4) How to Run API Tests (Karate)

From the repository root:

```bash
cd api-tests/api-tests
mvn clean test
```

### Karate Report (HTML)
Karate generates an HTML report at:

- `api-tests/api-tests/target/karate-reports/karate-summary.html`

Open it on Windows (PowerShell):

```powershell
cd api-tests/api-tests
start .\target\karate-reports\karate-summary.html
```

---

## 5) How to Run UI Tests (Playwright)

From the repository root:

```bash
cd ui-tests
npm ci
npx playwright test
```

### Playwright Report (HTML)
To open the last HTML report:

```bash
cd ui-tests
npx playwright show-report
```

This starts a local server and opens the report in your browser.

---

## 6) Reporting Requirements (How to Generate & View Reports)

### API (Karate)
- Generate: `mvn clean test` (inside `api-tests/api-tests`)
- View: open `target/karate-reports/karate-summary.html`

### UI (Playwright)
- Generate: `npx playwright test` (inside `ui-tests`)
- View: `npx playwright show-report`

---

## 7) Bugs / Findings / Observations

### 7.1 Intermittent Booking Failures (409 Conflict)
In repeated runs, `POST /api/booking/` occasionally returned:

- **409 Conflict**
- Response: `{"error":"Failed to create booking"}`

**Likely cause:** shared/public sandbox state and intermittent conflicts.

**Mitigation implemented:**
- Use future dynamic dates to reduce collisions
- Keep the test atomic (derives required data in the same run)
- If the environment is consistently failing, the test fails (correct behavior)

### 7.2 API Endpoints Live Under `/api`
Manual exploration confirmed the correct prefix:

- `/api/branding/`
- `/api/room/`
- `/api/booking/`

This was validated before automation to avoid incorrect assumptions.

---

## 8) CI/CD Integration (How I Would Do It)

A practical CI/CD setup:

- Use **GitHub Actions** to run both suites on:
  - `push`
  - `pull_request`

- Upload reports as **CI artifacts** so reviewers can download them:
  - Karate: `api-tests/api-tests/target/karate-reports`
  - Playwright: `ui-tests/playwright-report` (and/or `ui-tests/test-results` depending on config)

Recommended pipeline stages:
1. Checkout repository
2. Set up Java (e.g., Temurin 17) + run Karate tests
3. Set up Node (e.g., Node 20) + install deps + install Playwright browsers + run UI tests
4. Upload reports as artifacts
5. Run UI tests across multiple browsers (Chromium/WebKit/Firefox) if required.

---

## 9) Git:

```bash
git status
git log --oneline --decorate -10
```

### 9.2 

### 9.3 Push This Repo to GitHub (common workflow)
1) Create a new empty repo in GitHub (no README/license added by GitHub).

2) In local repo root:

```bash
git remote -v
git remote add origin https://github.com
git branch -M main
git push -u origin main
```



## 10) Commands 

### API
```bash
cd api-tests/api-tests
mvn clean test
```

### UI
```bash
cd ui-tests
npm ci
npx playwright test
npx playwright show-report
```