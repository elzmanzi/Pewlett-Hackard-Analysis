----------------------------------------
-------- Start Of Deliverable 1---------
----------------------------------------
-- CHECKING TABLES
SELECT *
FROM retirement_titles

-- step 1 CREATING new table retirement_titles
DROP TABLE IF EXISTS retirement_titles;
SELECT e.emp_no, e.first_name,e.last_name, t.title,
t.from_date,t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Step 2 creating unique_titles

--checking my table
SELECT *
FROM unique_titles

-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE IF EXISTS unique_titles;
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name, title
INTO unique_titles
FROM retirement_titles as r
WHERE (r.to_date = '9999-01-001')
ORDER BY r.emp_no, r.to_date DESC;

-- step 3 Creating retiring_titles

-- Checking my Table
SELECT *
FROM unique_titles

-- counting tittles
DROP TABLE IF EXISTS retiring_titles;
SELECT  COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC

-- checking the new table 
SELECT *
FROM retiring_titles
----------------------------------------
-------- End Of Deliverable 1-----------
----------------------------------------


----------------------------------------
-------- start Of Deliverable 2---------
----------------------------------------
-- Checking table 
SELECT * 
FROM titles

-- step 1 CREATING new table mentorship_eligibilty
DROP TABLE IF EXISTS mentorship_eligibilty;
SELECT e.emp_no, e.first_name,e.last_name,e.birth_date,
t.from_date,t.to_date,t.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND t.to_date = '9999-01-01')
ORDER BY e.emp_no

-- checking the new table
SELECT * 
FROM mentorship_eligibilty

----------------------------------------
-------- End Of Deliverable 2-----------
----------------------------------------

--------For Analysis--------------------
---- Number of those participating in mentorship program --- 
SELECT *
FROM mentorship_eligibilty

-- counting tittles for those participating in mentorship programm
-- DROP TABLE IF EXISTS mentorship_participating;
SELECT  COUNT(title), title
--INTO retiring_titles
FROM mentorship_eligibilty
GROUP BY title 
ORDER BY COUNT(title) DESC

