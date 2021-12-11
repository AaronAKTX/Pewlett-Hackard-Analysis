# Pewlett-Hackard-Analysis

## Overview
Employees born between 1952 and 1955 are at or near retirement age. Pewlett Hackard has many employees that fall in that age category. This analysis queried the PH database for all employees in that age bracket to prepare for the potential impact of a large group of people retiring in a relatively small period of time. The analyis also included the title of the soon to be retired person in order to gain an understanding of which jobs would be most impacted. We summed the total retirement age employee by job title as well and found some interesting results. For example, Pewlett-Hackard will probably need to start promoting to or hiring some Senior lever Engineers and Staff member as many of them may soon be retired. Finally, a search for employees born in 1965, was conducted as a way of finding potential participants in a mentorship program.

## Results: 

- The Retirement Age Employees by Job Title

<img src = "https://github.com/AaronAKTX/Pewlett-Hackard-Analysis/blob/main/Retiring_Per_Title.PNG">

- Senior Level Positioned Employees will be Moving on Soon.
The table above clearly shows a very high number of Senior level Engineers and Staff members are at a retirement age.

- Management is Fine
Only two managers are in the retirement age range, so let's not go looking to hire more managers.  

-- The Mentorship Program Can Help Prepare for the Tsunami of Retirees
A transitioning program that will allow older employees to begin the retirement process while also contributing to the maintanence of the high quality of work is great idea. Only searching for people born in 1965, which is completely arbitrary, yielded a large list of 1549 employees that could mentor newer employees until they were at the point of taking Senior level responsibility. Expanding the age range or looking instead at years with the Pewlett-Hackard would definitely lead to even more potential mentors.

-- Mentoring won't be enough alone
Even expanding the mentorship won't be enough to compensate for the total number of retirees. Pewlett-Hackard will need to go on an immediate, extensive talent search and expect to have to pay these young whipper snappers.

-- Summary

--- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Based on the data in the retiring_titles table, a total of 90,398 roles will need to be filled.
After filtering out titles that had already ended and recalculating, 74,458 jobs will need to be filled.

--- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
If we go by the mentoring search in the challenge, there is not near enough retirement-ready employees to mentor the next generation. If we include every employee, not just employees born in 1965, there may be enough to get a good number of people mentored. It's also notable that there are many non-senior level positions that are the retirement age as well so, senior level positions won't all be able to be filled internally. For example, looking at currently employed Senior Engineers in Production, 10189 are retiring. 3611 Engineers in Production are retiring as well, which will leave less than 9000 Engineers in Production. 9000 is less than than 10,000+ Senior engineers retiring. Below is a table with current employee counts, retiring age employee counts, pct of title retiring broken down by department and title.





with emp_counts as(
SELECT  count(e1.emp_no) as count_current_emp, t1.title, d.dept_name, coalesce(e2.retiring_current_emp,0) as count_of_retiring_age_emp
FROM 
employees e1
inner join titles t1 on e1.emp_no = t1.emp_no
inner join dept_emp de1 on e1.emp_no = de1.emp_no 
inner join departments d on de1.dept_no =d.dept_no
LEFT JOIN(
SELECT  count(e.emp_no) as retiring_current_emp, t.title, d.dept_name
FROM 
employees e
inner join titles t on e.emp_no = t.emp_no
inner join dept_emp de on e.emp_no = de.emp_no 
inner join departments d on de.dept_no =d.dept_no
where t.to_date = '9999-01-01' and de.to_date = '9999-01-01'
and e.birth_date <= '1955-12-31'
group by  t.title, d.dept_name) as e2 
on d.dept_name = e2.dept_name and t1.title = e2.title

where t1.to_date = '9999-01-01' and de1.to_date = '9999-01-01'

group by  t1.title, d.dept_name,e2.retiring_current_emp
order by d.dept_name, t1.title
)
SELECT count_current_emp, count_of_retiring_age_emp, round(cast((count_of_retiring_age_emp/count_current_emp::float) * 100.00 as numeric),2) as pct_workforce_retiring, title, dept_name
--into current_employed_counts_per_dept_title	
from emp_counts


Deliverable 3 Requirements
Structure, Organization, and Formatting (6 points)
The written analysis has the following structure, organization, and formatting:

There is a title, and there are multiple sections. (2 pt)
Each section has a heading and subheading. (2 pt)
Links to images are working and displayed correctly. (2 pt)
Analysis (14 points)
The written analysis has the following:

Overview of the analysis:

The purpose of the new analysis is well defined. (3 pt)
Results:

There is a bulleted list with four major points from the two analysis deliverables. (6 pt)
Summary:

The summary addresses the two questions and contains two additional queries or tables that may provide more insight. (5 pt)
