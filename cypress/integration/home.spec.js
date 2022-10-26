describe("an e-commerce store for plants", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("shows products on the home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("shows 2 products on the home page", () => {
    cy.get(".products article").should("have.length", 2);
  });

});
