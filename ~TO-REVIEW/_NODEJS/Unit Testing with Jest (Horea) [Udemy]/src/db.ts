import { Pool, QueryResult } from "pg";

const pool = new Pool({
  host: "127.0.0.1",
  port: 5432,
  database: "learning",
  user: "mani",
  password: "password",
  max: 100, // number of pool
  connectionTimeoutMillis: 0, // how long to wait for available pool
  idleTimeoutMillis: 0, // when to close pool after unsued
});

// the pool will emit an error on behalf of any idle clients
// it contains if a backend error or network partition happens
pool.on("error", (err, client) => {
  console.error("Unexpected error on idle client", err);
  process.exit(-1);
});

export const pgQuery = async (
  text: string,
  params?: Array<any> | any,
  callback?: (err: Error, result: QueryResult<any>) => void,
) => {
  const connection = await pool.connect();

  try {
    return await connection.query(text, params, callback!);
  } catch (e) {
    console.log(e);
  } finally {
    connection.release();
  }
};

export const pgClient = () => {
  return pool.connect();
};
