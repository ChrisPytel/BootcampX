//initial setup for our node-postgres module to connect with the psql database we've created
const { Pool } = require("pg");

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});
 
//------------------------------------------------------------------------------
//  Now we are using command line args to pass in the month of cohort,
//  and how many rows we want sql return to be limited by

// pool.query(`
//   SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
//   FROM teachers
//   JOIN assistance_requests ON teacher_id = teachers.id
//   JOIN students ON student_id = students.id
//   JOIN cohorts ON cohort_id = cohorts.id
//   WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
//   ORDER BY teacher;`)
// .then(res => {
//   res.rows.forEach(row => {
//     console.log(`${row.cohort}: ${row.teacher}`);
//   })
// });

//------------------------------------------------------------------------------
//  Now with parameterized queries to guard against malicious SQL injection
//  Reminder - when passing args in the array, they need to correspond to the order you added them in the SQL statement

pool.query(`
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name = '$1'
  ORDER BY teacher;`,
  [process.argv[2] || 'JUL02'])
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
});