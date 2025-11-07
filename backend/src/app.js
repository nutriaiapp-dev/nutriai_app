import express from "express";
import morgan from "morgan";
import cors from "cors";

//Routes

import usersRouter from "./routes/users.routes.js";
import authRouter from "./routes/auth.routes.js";

const app = express();

// Settings

app.set("port", 4000);

// Middlewares

app.use(morgan("dev"));
app.use(express.json());
app.use(cors());

//Routes

app.use("/api", usersRouter);
app.use('/api/auth', authRouter);

app.use((req,res, next) => {

    res.status(404).json({
        message: "Page not found",
    })
});

export default app;


