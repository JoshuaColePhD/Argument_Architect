import { runSmoke, assert } from "./smoke-lib.mjs";

await runSmoke("Argument Architect", async (page) => {
  assert((await page.title()).includes("Argument Architect"), "unexpected page title");
  // Prompt cards render from GAME_DATA on load.
  const cards = page.locator("#prompt-grid > .selectable-card");
  await cards.first().waitFor({ state: "visible", timeout: 10000 });
  const count = await cards.count();
  assert(count >= 2, `expected at least 2 prompt cards, found ${count}`);
  // Choosing a prompt starts a mission and shows the first choice phase.
  await cards.first().click();
  await page.locator("#phase-choice").waitFor({ state: "visible", timeout: 10000 });
  const options = await page.locator("#choice-list > *").count();
  assert(options >= 2, `expected choices after starting a mission, found ${options}`);
});
