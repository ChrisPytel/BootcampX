/* 03 Assistance Requests Data

Each assistance request is related to a bunch of data like a teacher, student, an optional assignment, and more. 
We want to be able to see all important data about an assistance request.

=> Get important data about each assistance request 
  -  Select the teacher's name, student's name, assignment's name if it has one, and the duration of each assistance request.
  -  Subtract completed_at by started_at to find the duration.
  -  Order by the duration of the request.   */

SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, (completed_at - started_at) AS duration
FROM assistance_requests
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;