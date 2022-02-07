import express from "express";
import crypto from "crypto";
const app = express();
const port = process.env.PORT | 3000;

app.use(express.json());

app.post("/hash", (req, res) => {
   const password = req.body.password;
   const salt = crypto.randomBytes(128);
   const iterations = 10000;
   const hash = crypto.pbkdf2(
      password,
      salt,
      iterations,
      64,
      "sha512",
      (err, derivedKey) => {
         res.send(derivedKey.toString("hex"));
      }
   );
});

app.get("/", (req, res) => {
   res.send("GET request received");
});

app.listen(port, () => {
   console.log(`App Started on Port ${port}`);
   console.log("Adding this as debugging I guess");
});
