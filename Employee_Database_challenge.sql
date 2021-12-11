SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN  titles t ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles rt 
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT(ut.emp_no) AS title_count, ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title
ORDER BY title_count DESC;

SELECT DISTINCT ON(e.emp_no) e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join titles t on e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no






SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO non_retirement_titles
FROM employees e
INNER JOIN  titles t ON e.emp_no = t.emp_no
WHERE (e.birth_date > '1955-12-31')
ORDER BY e.emp_no;



SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO non_unique_titles_new
FROM non_retirement_titles rt 
where rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT(ut.emp_no) AS title_count, ut.title
INTO non_retiring_titles_new
FROM non_unique_titles_new ut
GROUP BY ut.title
ORDER BY title_count DESC;



SELECT count(title), title FROM titles
where to_date > NOW()
group by title




