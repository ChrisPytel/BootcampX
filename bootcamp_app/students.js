//initial setup for our node-postgres module to connect with the psql database we've created
const { Pool } = require("pg");

const args = process.argv.slice(2);

console.log(`Our args is: `, args);

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});

// ---- uses the pool.query method to take an SQL query
// ---- and returns a promise containing the result
pool.query(
  `SELECT id, name, cohort_id
  FROM students
  LIMIT 5;`)
  .then((res) => {
    console.log(`object returned from SQL query is:\n`, res.rows);
  })
  .catch((err) => console.error("query error", err.stack));

// ---- this time we JOINed the cohorts to display cohorts.name instead of the id#
// ---- and we can can access the res.rows and loop through 
  pool.query(
    `SELECT students.id, students.name, cohorts.name
    FROM students
    JOIN cohorts ON cohorts.id = cohort_id
    LIMIT 5;`)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
    });
  });