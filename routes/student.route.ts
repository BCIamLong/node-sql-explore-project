import { Router } from "express";
import { StudentController } from "../controllers";
import { asyncCatch } from "../utils";

const studentRoute = Router();

const studentController = new StudentController();

studentRoute
  .route("/")
  .get(asyncCatch(studentController.getStudents))
  .post(asyncCatch(studentController.createStudent));
// .get(asyncCatch(studentController.getStudents.bind(studentController)));

studentRoute.route("/:id").get(asyncCatch(studentController.getStudent));
// .get(asyncCatch(studentController.getStudent.bind(studentController)));

export default studentRoute;
