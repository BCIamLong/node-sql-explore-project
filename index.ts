import "dotenv/config";
import App from "./app";
import "./connect";

const port = process.env.PORT || 3333;

const app = new App(+port);

app.listen();
// app.listen(port, () => console.log(`Server is listening at port ${port}`));
