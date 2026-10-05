import express from "express";
import cors from "cors";

const app = express();

app.use(cors({ optionsSuccessStatus: 200 }));

app.use(express.static("public"));

app.get("/", (_req, res) => {
  res.sendFile(import.meta.dirname + "/views/index.html");
});

// Do not change code above this line
app.get("/api{/:date}", (req, res) => {
  const date_string = req.params.date;

  // If no date is provided, use the current date
  if (!date_string) {
    console.log(date_string);
    const currentDate = new Date();
    return res.json({
      unix: currentDate.getTime(),
      utc: currentDate.toUTCString(),
    });
  }

  // Check if the date string is a valid number (Unix timestamp)
  if (!isNaN(date_string)) {
    const unixTimestamp = parseInt(date_string);
    const date = new Date(unixTimestamp);
    return res.json({
      unix: date.getTime(),
      utc: date.toUTCString(),
    });
  }

  // Try to parse the date string as a valid date
  const parsedDate = new Date(date_string);
  if (parsedDate.toString() === "Invalid Date") {
    //throw new Error("Invalid date");
    return res.send({ error: "Invalid Date" });
  }

  return res.json({
    unix: parsedDate.getTime(),
    utc: parsedDate.toUTCString(),
  });
});
// Do not change code below this line

const PORT = 8000;
const listener = app.listen(PORT, function () {
  console.log("Your app is listening on port " + listener.address().port);
});
