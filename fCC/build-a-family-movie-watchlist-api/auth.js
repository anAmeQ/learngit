import express from "express";
import bcrypt from "bcryptjs";
import { findByUsername } from "../utils/db.js";
import { signToken } from "../utils/jwt.js";

const router = express.Router();
export default router;

router.post("/login", async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res
      .status(400)
      .json({ error: "Username and password are required." });
  }
  const user = findByUsername(username);
  if (!user || !bcrypt.compareSync(password, user.passwordHash)) {
    return res.status(401).json({ error: "Invalid username or password." });
  }
  const token = signToken({
    id: user.id,
    role: user.role,
  });
  res.json({ message: "Login successful", token });
});
