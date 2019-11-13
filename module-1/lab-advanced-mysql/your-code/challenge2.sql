#CHAllENGE 2 ALTERNATIVE SOLUTION

SELECT au_id AS 'Author ID',
advance + sum(sales_royalty) as Profits
FROM (SELECT authors.au_id,
t.title_id,
t.price * sales.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty,
t.advance * ta.royaltyper / 100 as advance
FROM authors
INNER JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN sales ON sales.title_id = t.title_id)
AS royalties
GROUP BY  au_id, title_id, advance
ORDER BY Profits DESC LIMIT 3;
