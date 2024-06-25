import { Request, Response } from "express";
import StudentServiceV0 from "../services/student.service-v0";

class StudentControllerV0 {
  public studentsService = new StudentServiceV0();

  constructor() {
    // * bind method way to resolved the problem of this keyword with callback function
    this.getStudent = this.getStudent.bind(this);
    this.getStudents = this.getStudents.bind(this);
    this.createStudent = this.createStudent.bind(this);
    this.deleteStudent = this.deleteStudent.bind(this);
    this.updateStudent = this.updateStudent.bind(this);
  }

  getStudents = async (req: Request, res: Response) => {
    const students = await this.studentsService.getAll();

    res.json({
      status: "success",
      data: {
        students,
      },
    });
  };

  async getStudent(req: Request, res: Response) {
    const { id } = req.params;
    const student = await this.studentsService.getOne(id);
    // console.log(student);

    res.json({
      status: "success",
      data: {
        student,
      },
    });
  }

  async createStudent(req: Request, res: Response) {
    const { Name, Email, Phone } = req.body;
    const student = await this.studentsService.postOne({ Name, Email, Phone });

    res.status(201);
    res.json({
      status: "success",
      data: {
        student,
      },
    });
  }

  async updateStudent(req: Request, res: Response) {
    const { id } = req.params;
    const student = await this.studentsService.updateOne(id, req.body);

    res.json({
      status: "success",
      data: {
        student,
      },
    });
  }

  async deleteStudent(req: Request, res: Response) {
    const { id } = req.params;
    await this.studentsService.deleteOne(id);

    res.status(204);
    res.json({
      status: "success",
      data: null,
    });
  }

  // * because we are using these methods as the callback function and in JS if we use callback function we call app.get('/', studentController.getStudents)
  // * then this keyword now is not the studentController but it's the app which is call the get method right so studentController.getStudents this returns the callback function and app is responsible for call this callback
  // * therefore we can use the trick that use the arrow function as the code bellow because as we know arrow function doesn't refer to the this keyword which is calling the function
  // * but it's referred to the parent this keyword which is in this case the this keyword is the instance of the class and that's what we want right
  // * so StudentController => callback function function and then app call the get which is broadcast the event and call the callback function
  // * StudentController (parent this keyword) -> app (current this keyword)
  // * use arrow to access to the parent this keyword so that's this trick
  // * but i prefer the way we use bind method to solve this problem rather than using this trick because it's not more readable code right
  // * so therefore in this case i will use bind method way
  // getStudents = async (req: Request, res: Response) => {
  //   const students = await this.studentsService.getAll();

  //   res.json({
  //     status: "success",
  //     data: {
  //       students,
  //     },
  //   });
  // };
}

export default StudentControllerV0;
