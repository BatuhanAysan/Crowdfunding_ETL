-- Verify the table
SELECT * FROM campaign
SELECT * FROM contacts
SELECT * FROM category
SELECT * FROM subcategory

-- Verify Foreign Keys
SELECT ca.outcome, c.first_name, c.last_name, cat.category, sc.subcategory
FROM campaign AS ca
JOIN contacts AS c
ON ca.contact_id = c.contact_id
JOIN category AS cat
ON ca.category_id = cat.category_id
JOIN subcategory AS sc
ON ca.subcategory_id = sc.subcategory_id

-- Verify Data Type (date)
SELECT outcome,launched_date
FROM campaign
WHERE DATE_PART('year', launched_date) = 2022;

SELECT outcome,end_date
FROM campaign
WHERE DATE_PART('year', end_date) = 2021;