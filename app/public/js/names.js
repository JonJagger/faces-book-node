"use strict";

module.exports = names;

const Glob = require("glob");
const Path = require("path");

function names(year) {
  let result = [];
  const filenames = Glob.sync(`public/img/${year}/*.jpg`);
  filenames.forEach(function(filename) {          // "Sindhu.jpg"
    const ext = Path.extname(filename);           // ".jpg"
    const basename = Path.basename(filename,ext); // "Sindu"
    result.push(basename);
  });
  return result;
}
