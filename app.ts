import express, { Application } from "express";
import morgan from "morgan";

import AppRouter from "./routes";
// import connectDB from "./connect";

// const app = express();

// if (process.env.NODE_ENV === "development") app.use(morgan("dev"));

// app.use(express.json({ limit: "90kb" }));
// app.use(express.urlencoded({ extended: true }));

// // app.use(route);

// export default app;

export default class App {
  public app: Application;
  public port: number;

  public appRouter = new AppRouter();

  constructor(port: number) {
    this.port = port;
    this.app = express();

    // this.initializeDatabaseConnection();
    this.initializeMiddlewares();
    this.initializeAppRouter();
    this.initializeGlobalErrorHandler();
  }

  private initializeMiddlewares() {
    if (process.env.NODE_ENV === "development") this.app.use(morgan("dev"));
    this.app.use(express.json({ limit: "90kb" }));
    this.app.use(express.urlencoded({ extended: true }));
  }

  private initializeAppRouter() {
    this.app.use(this.appRouter.router);
  }

  private initializeGlobalErrorHandler() {}

  // private initializeDatabaseConnection() {
  //   connectDB();
  // }

  public listen() {
    this.app.listen(this.port, () =>
      console.log(`Server is listening at port ${this.port}`)
    );
  }
}
