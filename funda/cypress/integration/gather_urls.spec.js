describe('Funda', () => {
  let max_pages;
  let urls = [];

  it('get max number of pages', () => {
    cy
    	.visit(`https://www.funda.nl/${Cypress.env('KIND')}/${Cypress.env('PLACE')}/1-dag`)
    	.get('.pagination-pages a:last-child')
    	.each(function($el) {
    		max_pages = $el.attr('data-pagination-page');
    	});
  });

  it('gather urls', () => {
  	for (let i = 1; i <= max_pages; i++) {
	  cy
	  	.wait(Math.floor(2500 + 5000 * Math.random()))
    	.visit(`https://www.funda.nl/${Cypress.env('KIND')}/${Cypress.env('PLACE')}/1-dag/p${i}`)
    	.get(`.search-result-header > a[href^="https://www.funda.nl/${Cypress.env('KIND')}"][href*="resultlist"]`)
    	.each(function($el) {
    	  const url = $el.attr('href');
    	  if (url.indexOf('huis') >= 0 || url.indexOf('appartement') >= 0) {
		    urls.push(url);
		  }
    	});
    }
  });

  it('write file', () => {
    cy.writeFile(`${Cypress.env('KIND')}_${Cypress.env('PLACE')}_urls.txt`, urls.join('\n') + '\n');
  });
})