-- Challenge Queries

-- Deliverable 1
-- Retirement Titles Table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.title DESC;
-- Number of employees by their most recent job title who are about to retire
SELECT COUNT(rt.emp_no),
	rt.title
INTO retiring_titles
FROM retirement_titles as rt
GROUP BY rt.title
ORDER BY COUNT (rt.title) DESC;



--Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorhsip_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti 
ON (ti.emp_no = e.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;



-- Deliverable 3

--Overview of the Analysis
-- The purpose of this analysis is to find the number employees eligible to retire from Hewlett-Packard; after that, 
-- the next deliverable is determining how many current employees are eligible to participate in a mentorship program.

-- Results
-- 1) The 2 largest title of employees leaving are senior enginners and senior staff meaning Hewlett-Packard is going to be losing a lot of senior employees
-- 2) Only 2 managers are retiring which means positions of leadership will remain largely unchanged even with the large amount of turnover
-- 3) The Development, Production, and Sales Departments are losing the most employees to retirement, losing 9281, 8174, and 5860 employees respectively.
-- 4) The Finance and Human Resources Departments are the only departments losing fewer than 2000 employees.

-- Summary
-- There are almost 36500 employees scheduled to retire from Hewlett-Packard. You can see that from adding all the total retirees from each department shown
-- in the dept_retirements table. There are not enough qualified employees to mentor the next generation, there are only 1549 qualified employees, which falls
-- well short of the amount that need to be replaced.