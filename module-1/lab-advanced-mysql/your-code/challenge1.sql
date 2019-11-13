#CHALLENGE 1

DROP TABLE IF EXISTS Sales_royalty;
DROP TABLE IF EXISTS Total_royalties;

CREATE TEMPORARY TABLE IF NOT EXISTS Sales_royalty
SELECT authors.au_id as `Author Id`,
t.title_id as `Title Id`,
t.price * sales.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
FROM authors
INNER JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN sales ON sales.title_id = t.title_id;

CREATE TEMPORARY TABLE IF NOT EXISTS Total_royalties
SELECT Sales_royalty.`Author Id`,
Sales_royalty.`Title Id`,
sum(Sales_royalty.sales_royalty) as `Agregated royalties`
FROM Sales_royalty
GROUP BY  Sales_royalty.`Author Id`, Sales_royalty.`Title Id`;

SELECT tr.`Author Id`,
t.advance * ta.royaltyper / 100 + tr.`Agregated royalties` as Profits
FROM Total_royalties as tr
INNER JOIN titleauthor as ta ON tr.`Title Id` = ta.title_id
INNER JOIN titles t ON t.title_id = tr.`Title Id`
ORDER BY Profits DESC LIMIT 3;