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
      await sql.query`INSERT INTO Student (Name, Email, Phone) VALUES (${Name}, ${Email}, ${Phone})`;

    return student;
  }
}

export default StudentService;
