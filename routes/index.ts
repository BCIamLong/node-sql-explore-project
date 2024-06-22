import { Router } from "express";
import studentRoute from "./student.route";

const route = Router();

route.use("/students", studentRoute);

export default route;
