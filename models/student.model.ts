import sql from "mssql";

export default class Student {
  constructor() {
    // public Phone: string // public Email: string, // public Name: string, // public Id: number,
    this.initializeModel();
  }
  async initializeModel() {
    await sql.query`IF NOT EXISTS (SELECT * FROM sys.objects
      WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
      BEGIN
      CREATE TABLE Student (
        Id int primary key Identity,
        Name nvarchar(100) NOT NULL,
        Email nvarchar(100) NOT NULL UNIQUE,
        Phone nvarchar(20) NOT NULL UNIQUE
        );
        END;`;
  }
}
