import "dotenv/config";
import "./connect";
import App from "./app";

const port = process.env.PORT || 3333;

const app = new App(+port);

app.listen();
// app.listen(port, () => console.log(`Server is listening at port ${port}`));
