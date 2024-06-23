import sql, { config } from "mssql";

const sqlConfig: config = {
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  server: process.env.DB_SERVER!,
  pool: {
    max: 10,
    min: 0,
    idleTimeoutMillis: 30000,
  },
  options: {
    // encrypt: true, // for azure
    trustServerCertificate: true, // change to true for local dev / self-signed certs
  },
};

// const connectDB = async () => {
//   try {
//     await sql.connect(sqlConfig);
//     console.log("SQL DB connect successful");
//   } catch (err) {
//     console.log(err);
//   }
// };

// export default connectDB;
(async () => {
  try {
    await sql.connect(sqlConfig);
    console.log("SQL DB connect successful");
  } catch (err) {
    console.log(err);
  }
})();
