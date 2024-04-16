/* Cohort With Longest Assistances

=> Get the cohort with the longest average duration of assistance requests.
  -  The same requirements as the previous query, but only return the single row with the longest average. */

SELECT cohorts.name AS name, AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC 
LIMIT 1;