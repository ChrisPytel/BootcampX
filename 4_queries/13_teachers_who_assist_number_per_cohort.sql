/* Name of Teachers and Number of Assistances

We need to know which teachers actually assisted students during any cohort, and how many assistances they did for that cohort.

=> Perform the same query as before, but include the number of assistances as well. 
  -  Get the name of all teachers that performed an assistance request during a cohort.
  -  Select the instructor's name and the cohort's name.
  -  Don't repeat the instructor's name in the results list.
  -  Order by the instructor's name.
  -  This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here.  */

SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;