SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
sum(sales.qty) as TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
RIGHT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC LIMIT 3;