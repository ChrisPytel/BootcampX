/* 01 Total Teacher Assistance Requests

We need to be able to see how many assistance requests any teacher has completed.

=> Get the total number of assistance_requests for a teacher 
  -  Select the teacher's name and the total assistance requests.
  -  Since this query needs to work with any specific teacher name, use 'Waylon Boehm' for the teacher's name here. */

SELECT COUNT(assistance_requests.id) AS total_assistances, teachers.name
FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;