import express, { Request, Response } from "express";

import { pgQuery } from "./db";

const app = express();
const { PORT = 3000 } = process.env;

app.get("/", (req: Request, res: Response) => {
  res.send({
    message: "hello world",
  });
});

const result = async () => {
  const result = await pgQuery("SELECT * FROM customers");
  console.log(result);
};

result();

app.listen(PORT, () => {
  console.log("server started at http://localhost:" + PORT);
});
