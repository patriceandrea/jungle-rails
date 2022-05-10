describe('visit product page ', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('click on item , redirects you to item page, should contain a class called product detail  ', () => {
    cy.get(':nth-child(1) > a > img').click()
    cy.contains('article', 'Cliff Collard')
    cy.get('.product-detail').should('exist')
  })
})