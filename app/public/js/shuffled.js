"use strict";

const randomInt = require("./randomInt.js");

module.exports = shuffled;

function shuffled(array) {
  const shuffled = array.slice(0);
  for (let i = 0; i < shuffled.length; i++) {
    const swap = randomInt(0, i);
    const temp = shuffled[swap];
    shuffled[swap] = shuffled[i];
    shuffled[i] = temp;
  }
  return shuffled;
}
