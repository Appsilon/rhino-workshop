describe('app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('handles empty chart', () => {
    cy.get('#app-filters-species input')
      .each(checkbox => checkbox.click())
    cy.get('#app-chart-chart')
      .parent()
      .contains("Select some species")
  })
})
