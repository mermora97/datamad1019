SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
titles.title as TITLE,
publishers.pub_name as 	PUBLISHER
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id;