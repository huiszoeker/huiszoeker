SELECT
  sale.postal_code_prefix,
  sale.cnt AS sale_cnt,
  rent.cnt AS rent_cnt,
  sale.average_price AS average_sale_price,
  rent.average_price AS average_rent_price,
  sale.average_price / rent.average_price AS factor
FROM 
  (
    SELECT 
      COUNT(*) AS cnt,
      SUBSTR(postal_code,0,4) AS postal_code_prefix, 
      AVG(price/area) AS average_price 
    FROM 
      `funda.koop_utrecht`
    GROUP BY 
      postal_code_prefix
  ) AS sale,
  (
    SELECT
      COUNT(*) AS cnt,
      SUBSTR(postal_code,0,4) AS postal_code_prefix, 
      AVG(price/area) AS average_price 
    FROM 
      `funda.huur_utrecht`
    GROUP BY 
      postal_code_prefix
  ) AS rent
WHERE
  rent.postal_code_prefix = sale.postal_code_prefix AND
  sale.cnt                >= 5                       AND
  rent.cnt                >= 3
ORDER BY
  factor ASC