import express from "express";
import { authenticate } from "../middleware/authenticate.js";
import { authorizeModification } from "../middleware/authorize.js";
import {
  getWatchlist,
  addMovie,
  updateMovie,
  deleteMovie,
} from "../utils/db.js";

const router = express.Router();
export default router;

router.get("/:userId", authenticate, (req, res) => {
  const { userId } = req.params;
  const watchlist = getWatchlist(parseInt(userId));
  if (!watchlist) {
    return res.status(404).json({ message: "User not found" });
  }
  res.json(watchlist);
});

router.post(
  "/:userId/movies",
  authenticate,
  authorizeModification,
  (req, res) => {
    const { userId } = req.params;
    addMovie(parseInt(userId), req.body);
    res.status(201).json({ message: "Movie added to watchlist" });
  },
);

router.put(
  "/:userId/movies/:movieId",
  authenticate,
  authorizeModification,
  (req, res) => {
    const { userId, movieId } = req.params;
    updateMovie(parseInt(userId), parseInt(movieId), req.body);
    res.json({ message: "Movie updated in watchlist" });
  },
);

router.delete(
  "/:userId/movies/:movieId",
  authenticate,
  authorizeModification,
  (req, res) => {
    const { userId, movieId } = req.params;
    deleteMovie(parseInt(userId), parseInt(movieId));
    res.json({ message: "Movie deleted from watchlist" });
  },
);
