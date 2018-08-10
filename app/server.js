"use strict";

const express = require("express");
const ejs = require("ejs");
const names = require("./public/js/names.js");
const shuffled = require("./public/js/shuffled.js");
const runTests = require("./public/js/tests/run.js");

const app = express();

app.use(express.static("./public"))
app.engine("html", ejs.renderFile);

app.get(["/","/index","/years"], (req,res) => {
  res.render("years.html");
});

app.get("/faces", (req,res) => {
  const year = parseInt(req.query.year);
  res.render("faces.html", {year:year});
});

app.get("/shuffle", (req,res) => {
  const year = parseInt(req.query.year);
  res.json(shuffled(names(year)));
});

app.get("/test", (req,res) => {
  res.json({"runTests":runTests()});
});

const PORT = process.env.NODE_PORT;
app.listen(PORT);
console.log(`Running on port ${PORT}`);