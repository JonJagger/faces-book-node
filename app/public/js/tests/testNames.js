"use strict";

module.exports = testNames;

const names = require("./../names.js");
const assert = require("assert");

function testNames() {
  test_2017();
  test_2018();
}

const test_2017 = function() {
  const all = names(2017);
  const some = [ "Murali", "Shravan", "Deekshita", "Srikar", "Surya" ];
  some.forEach(function(name){
    assert.ok(all.includes(name), `No ${name}!`);
  });
  assert.equal(34, all.length);
};

const test_2018 = function() {
  const all = names(2018);
  const some = [ "Akshat", "Keerthana", "Supriya", "Sudeep" ];
  some.forEach(function(name){
    assert.ok(all.includes(name), `No ${name}`);
  });
  assert.equal(26, all.length);
};

