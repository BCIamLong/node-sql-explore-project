import express, { Request, Response } from "express";
import morgan from "morgan";

import route from "./routes";

const app = express();

if (process.env.NODE_ENV === "development") app.use(morgan("dev"));

app.use(express.json({ limit: "90kb" }));
app.use(express.urlencoded({ extended: true }));

app.use(route);

export default app;
