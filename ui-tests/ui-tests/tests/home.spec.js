const { test, expect } = require('@playwright/test');

test('Home: contact form is visible and booking buttons exist', async ({ page }) => {
  await page.goto('/');

  await expect(page.getByRole('heading', { name: /contact/i })).toBeVisible();

  const bookButtons = page.getByRole('button', { name: /book this room/i });
  const count = await bookButtons.count();
  expect(count).toBeGreaterThan(0);
});