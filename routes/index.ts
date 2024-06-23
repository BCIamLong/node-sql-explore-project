import { Router } from "express";
import StudentRouter from "./student.route";

// const route = Router();
// const studentRouter = new StudentRouter();

class AppRouter {
  public router = Router();
  public studentRouter = new StudentRouter();

  constructor() {
    this.setupRouters();
  }

  private setupRouters() {
    this.router.use("/students", this.studentRouter.router);
  }
}

// route.use("/students", studentRouter.router);

export default AppRouter;
