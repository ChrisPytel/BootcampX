/* Average Cohort Assistance Time

We need to be able to see the average duration of a single assistance request for each cohort.

=> Get the average duration of assistance requests for each cohort.
  -  Select the cohort's name and the average assistance request time.
  -  Order the results from shortest average to longest. */

SELECT cohorts.name AS name, AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_time;