describe("user clicking a product", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("takes users to the product detail", () => {
    cy.get(".products > article").first().click();

    cy.get(".product-detail").should("be.visible");
  });
});
