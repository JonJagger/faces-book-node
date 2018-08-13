"use strict";

module.exports = run;

function run() {
  require("./testRandomInt.js")();
  require("./testShuffled.js")();
  require("./testNames.js")();
  return "All tests passed";
}
