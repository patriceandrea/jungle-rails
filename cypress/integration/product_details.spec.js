describe('visit product page ', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('click on item , cart should contain 1 item ', () => {
    cy.get(':nth-child(2) > div > .button_to > .btn').click({ force: true })
    cy.get(':nth-child(6) > .nav-link').contains(1)
  })
  it('click on cart , redirects you to cart page ', () => {
    cy.get(':nth-child(2) > div > .button_to > .btn').click({ force: true })
    cy.get(':nth-child(6) > .nav-link').contains(1)
    cy.get(':nth-child(6) > .nav-link').click()
    cy.visit('http://localhost:3000/cart')
  })

})