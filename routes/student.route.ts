import { Router } from "express";
import { StudentController } from "../controllers";
import { asyncCatch } from "../utils";
import { StudentService } from "../services";

// const studentRoute = Router();

// const studentController = new StudentController();

// studentRoute
//   .route("/")
//   .get(asyncCatch(studentController.getStudents))
//   .post(asyncCatch(studentController.createStudent));
// // .get(asyncCatch(studentController.getStudents.bind(studentController)));

// studentRoute
//   .route("/:id")
//   .get(asyncCatch(studentController.getStudent))
//   .patch(asyncCatch(studentController.updateStudent))
//   .delete(asyncCatch(studentController.deleteStudent));
// // .get(asyncCatch(studentController.getStudent.bind(studentController)));

// export default studentRoute;

export default class StudentRouter {
  public router = Router();
  public studentController = new StudentController(
    new StudentService("Student")
  );

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router
      .route("/")
      .get(asyncCatch(this.studentController.getAll))
      .post(asyncCatch(this.studentController.create));
    // .get(asyncCatch(studentController.getStudents))
    // .post(asyncCatch(studentController.createStudent));

    this.router
      .route("/:id")
      .get(asyncCatch(this.studentController.getOne))
      .patch(asyncCatch(this.studentController.update))
      .delete(asyncCatch(this.studentController.delete));
    // .get(asyncCatch(studentController.getStudent))
    // .patch(asyncCatch(studentController.updateStudent))
    // .delete(asyncCatch(studentController.deleteStudent));
  }
}
