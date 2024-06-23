import sql from "mssql";
import { StudentInput } from "../interfaces";

class StudentService {
  async getAll() {
    const students = await sql.query`SELECT * FROM Student`;
    return students.recordset;
  }

  // * http://localhost:3333/students/DELETE%20FROM%20Student%20WHERE%20Email%20=%20nguyenvana@gmail.com
  // * be careful with SQL injection on the url because in this case if the hacker write the SQL query string to this param and then if we don't validate this param then it can be very dangerous
  // * like if hacker write: DELETE FROM Student, DROP DATABASE db_name ...
  // * so we need to validate this param like it must be int, string without special symbol and white space...
  async getOne(id: string) {
    // * because in this case our id is int in our DB then it's not be problem in this case because the SQL query string can't be convert to int right
    const student = await sql.query`SELECT * FROM Student where Id=${id}`;

    return student.recordset.length > 0 ? student.recordset[0] : null;
  }

  async postOne({ Name, Email, Phone }: StudentInput) {
    const student =
      await sql.query`INSERT INTO Student (Name, Email, Phone) VALUES (${Name}, ${Email}, ${Phone}) 
      SELECT * FROM Student WHERE id = SCOPE_IDENTITY();`;
    // * Use SCOPE_IDENTITY() to get the new ID value
    // * https://stackoverflow.com/questions/7917695/sql-server-return-value-after-insert
    // * https://learn.microsoft.com/en-us/sql/t-sql/functions/scope-identity-transact-sql?view=sql-server-ver16&redirectedfrom=MSDN

    return student.recordset[0];
  }

  async updateOne(id: string, { Name, Email, Phone }: StudentInput) {
    // let sqlStr: string | string[] = `UPDATE Student SET `;
    // if (Name) sqlStr = sqlStr + `Name = ${Name}, `;
    // if (Email) sqlStr = sqlStr + `Email = ${Email}, `;
    // if (Phone) sqlStr = sqlStr + `Phone = ${Phone}, `;
    // sqlStr = sqlStr.split("");
    // sqlStr[sqlStr.length - 2] = "";

    // sqlStr = sqlStr.join("");
    // sqlStr =
    //   sqlStr +
    //   ` WHERE Id=${id}
    //    SELECT * FROM Student WHERE Id=${id}`;

    // const sqlStr = `UPDATE Student SET Name = ${Name}, Email = ${Email}, Phone = ${Phone} WHERE Id = ${id}`;
    // console.log(sqlStr);
    // // console.log(sqlStr);
    // const student = await new sql.Request()
    //   .input("name", sql.NVarChar, Name)
    //   .input("email", sql.VarChar, Email)
    //   .input("phone", sql.VarChar, Phone)
    //   .input("id", sql.Int, +id)
    //   .query(
    //     "UPDATE Student SET Name = @name, Email = @email, Phone = @phone WHERE Id = @id",
    //     (err, result) => {
    //       console.log(err);
    //       console.log(result);
    //     }
    //   );

    // console.log(student);
    // ! one thing note here that:  sql.query`` this `` is not like in JS
    // ! so if we do it with sql.query`${sqlStr}` it will be sql.query`'UPDATE Student SET Name...'` then of course this is obviously an error
    // let sqlStr: string | string[] = "";
    // if (Name) sqlStr = sqlStr + `Name = ${Name}, `;
    // if (Email) sqlStr = sqlStr + `Email = ${Email}, `;
    // if (Phone) sqlStr = sqlStr + `Phone = ${Phone}, `;
    // sqlStr = sqlStr.split("");
    // sqlStr[sqlStr.length - 2] = "";

    // sqlStr = sqlStr.join("");
    // console.log(sqlStr);
    // ! so when we assign like Name = ${Name} it will be Name = 'name_value' which is valid but if we assign string like sqlStr = 'Name = 'value_name'' well somehow that the way in work in this sql.query and if we write `%{sql}` => `'Name = 'value_name''` => error
    const student =
      await sql.query`UPDATE Student SET Name = ${Name}, Email = ${Email}, Phone = ${Phone} WHERE Id=${id}
      SELECT * FROM Student WHERE Id = ${id}`;

    return student.recordset[0];
  }

  async deleteOne(id: string) {
    const student = await sql.query`DELETE FROM Student WHERE Id=${id}`;

    return student;
  }
}

export default StudentService;
