/* Name of Teachers That Assisted

We need to know which teachers actually assisted students during any cohort.

=> Get the name of all teachers that performed an assistance request during a cohort.
  -  Select the instructor's name and the cohort's name.
  -  Don't repeat the instructor's name in the results list.
  -  Order by the instructor's name.
  -  This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here. */

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;

/*  first version approach

SELECT  teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name, teachers.name
WHERE cohorts.name = 'JUL02';  */