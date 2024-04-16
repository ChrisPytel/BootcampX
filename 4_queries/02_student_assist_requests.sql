/* 02 Total Student Assistance Requests

We need to be able to see how many assistance requests any student has requested.

=> Get the total number of assistance_requests for a student
  -  Select the student's name and the total assistance requests.
  -  Since this query needs to work with any specific student name, use 'Elliot Dickinson' for the student's name here. */

SELECT COUNT(assistance_requests.id) AS total_assistances, students.name
FROM students
  JOIN assistance_requests ON student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;