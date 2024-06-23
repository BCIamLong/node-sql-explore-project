import { Router } from "express";
import { StudentController } from "../controllers";
import { asyncCatch } from "../utils";

const studentRoute = Router();

const studentController = new StudentController();

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
  public studentController = new StudentController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router
      .route("/")
      .get(asyncCatch(studentController.getStudents))
      .post(asyncCatch(studentController.createStudent));

    this.router
      .route("/:id")
      .get(asyncCatch(studentController.getStudent))
      .patch(asyncCatch(studentController.updateStudent))
      .delete(asyncCatch(studentController.deleteStudent));
  }
}
