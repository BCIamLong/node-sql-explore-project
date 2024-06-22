import "dotenv/config";
import app from "./app";
import "./connect";

const port = process.env.PORT || 3333;

app.listen(port, () => console.log(`Server is listening at port ${port}`));
