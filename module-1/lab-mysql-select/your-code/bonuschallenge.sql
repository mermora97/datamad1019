SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
ta.royaltyper * (t.advance + t.royalty * t.ytd_sales * t.price ) as PROFIT
FROM authors
LEFT JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON t.title_id = ta.title_id
ORDER BY PROFIT DESC LIMIT 3;