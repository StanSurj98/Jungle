describe("user clicking 'Add' button", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("adds item to cart and increments counter by 1", () => {
    cy.get(".button_to")
      .contains("Add", { matchCase: false })
      .first()
      .click({ force: true });

    cy.get(".end-0").contains("My Cart (1)")
  });
});