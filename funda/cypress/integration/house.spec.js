describe('Funda spec', () => {
  it('single house', () => {
	const url = Cypress.env('URL');

	let postal_code;
	let city;
	let address;
	let price;
	let build_year;
	let area;

	cy
	  .visit(url)
      .wait(10);

    cy
      .get('.object-header__address-city')
      .then(function($el) {
          const title = $el.text().trim();
          console.log('Title: ' + title);

         if (/\d{4} [A-Z]{2}/.exec(title)) {
              postal_code = /\d{4} [A-Z]{2}/.exec(title)[0];
              city        = /\d{4} [A-Z]{2} \w+/.exec(title)[0].substring(8);
          } else {
              postal_code = /\d{4}/.exec(title)[0];
              city        = /\d{4} \w+/.exec(title)[0].substring(5);
          }
      })
      .get('.object-header__address')
      .then(function($el) {
          const title = $el.text();
          console.log('Title: ' + title);        

         address = $el
             .children() // select all the children
             .remove()   // remove all the children
             .end()      // again go back to selected element
             .text()
             .trim();
      })  
      .get('body') 
      .then(function($body) {
          return {
              isOk:       $body.find('.object-media-fotos-container').length,
              hasService: $body.text().indexOf('Bijdrage VvE') >= 0
          };
      })
      .then(function(result) {
        const isOk       = result.isOk;
        const hasService = result.hasService;

       if (isOk) {
          // Price
          cy
            .get('.object-kenmerken-body > dl:nth-child(2) > dd:nth-child(2)')
            .then(function($el) {
              price = /\d+.\d+.\d+/.exec($el.text())[0].replace('.','').replace('.','');
            })
            // Build year
            .get('.object-kenmerken-body > dl:nth-child(5) > dd:nth-child(6)')
            .then(function($el) {
              build_year = /\d+/.exec($el.text())[0];
            })
            // Area
            .get('.object-kenmerken-body > dl:nth-child(8) > dd:nth-child(3) > dl > dd:nth-child(2)')
            .then(function($el) {
              area = /\d+/.exec($el.text())[0];

              const kind = url.indexOf('appartement') >= 0 ? 'appartement' : 'house';

             if (url.indexOf('appartement') >= 0 && hasService) {
                  cy
                      .get('.object-kenmerken-body > dl:nth-child(2) > dd:last-child')
                      .then(function($el) {
                        const service = /\d+/.exec($el.text())[0];

                       const body = JSON.stringify({
                          postal_code,
                          city,
                          kind,
                          address,
                          price,
                          build_year,
                          area,
                          service,
                          url
                        });

                       console.log(body);

                       cy.request({
                          url: 'http://localhost:4000/house',
                          method: 'POST',
                          headers: {
                            'Content-Type': 'application/json'
                          },
                          body: body
                        });
                      });
              } else {
                const body = JSON.stringify({
                  postal_code,
                  city,
                  kind,
                  address,
                  price,
                  build_year,
                  area,
                  url
                });

               console.log(body);

               cy.request({
                  url: 'http://localhost:4000/house',
                  method: 'POST',
                  headers: {
                    'Content-Type': 'application/json'
                  },
                  body: body
                });
              }
          });
        }
      });
  });
});