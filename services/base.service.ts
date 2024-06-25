import sql, { Request } from "mssql";

export default class BaseService<T> {
  // * this request is only use for read data
  // ! for write data we will create new request because we will declare input and inputs will keep after we
  // ! perform query which is can effect to another write request if we use the same input names

  private request: Request = new sql.Request();

  constructor(protected table: string) {}

  async getAll() {
    const queryStr = `SELECT * FROM ${this.table}`;
    const students = await this.request.query(queryStr);

    // const students = await sql.query`SELECT * FROM ${this.table}`;
    return students.recordset;
  }

  async getOne(id: string) {
    const queryStr = `SELECT * FROM ${this.table} where Id=${id}`;
    const student = await this.request.query(queryStr);

    return student.recordset.length > 0 ? student.recordset[0] : null;
  }

  async postOne(data: Omit<T, "Id">) {
    const columns = Object.keys(data);
    const values = Object.values(data);

    const valuesHolders = columns.map((_, ind) => `@value${ind}`);

    const queryStr = `INSERT INTO ${this.table} (${columns.join(
      ", "
    )}) VALUES (${valuesHolders.join(", ")}) 
    SELECT * FROM ${this.table} WHERE Id = SCOPE_IDENTITY();`;

    const request = new sql.Request();

    columns.forEach((_, ind) => {
      // console.log(`@value${ind}`, sql.VarChar, values[ind]);
      request.input(`value${ind}`, values[ind]);
    });

    const student = await request.query(queryStr);

    return student.recordset[0];
  }

  async updateOne(id: string, data: Partial<Omit<T, "Id">>) {
    const columns = Object.keys(data);
    const values = Object.values(data);

    const columnsAndItsPlaceholdersStr = columns
      .map((col, ind) => `${col} = @value${ind}`)
      .join(", ");

    const queryStr = `UPDATE Student SET ${columnsAndItsPlaceholdersStr} WHERE Id=${id}
    SELECT * FROM Student WHERE Id = ${id}`;

    const request = new sql.Request();
    columns.forEach((_, ind) => request.input(`value${ind}`, values[ind]));

    // console.log(queryStr);
    const student = await request.query(queryStr);

    return student.recordset[0];
  }

  async deleteOne(id: string) {
    const queryStr = `DELETE FROM Student WHERE Id=${id}`;

    this.request.query(queryStr);

    return null;
  }
}
