"use strict";

module.exports = testRandomInt;

const randomInt = require("./../randomInt.js");
const assert = require("assert");

function testRandomInt() {
  test_min_is_inclusive();
  test_max_is_exclusive();
  test_whole_range_is_covered();
}

const test_min_is_inclusive = function() {
  const counts = [0,0,0,0,0,0,0];
  for (let i = 0; i < 1000; i++) {
    const dice = randomInt(1,7);
    assert.ok(dice >= 1);
  }
};

const test_max_is_exclusive = function() {
  const counts = [0,0,0,0,0,0,0];
  for (let i = 0; i < 1000; i++) {
    const dice = randomInt(1,7);
    assert.ok(dice < 7);
  }
};

const test_whole_range_is_covered = function() {
  const counts = [0,0,0,0,0,0,0];
  for (let i = 0; i < 1000; i++) {
    const dice = randomInt(1,7);
    counts[dice]++;
  }
  assert.ok(counts[0] === 0);
  assert.ok(counts[1] > 0);
  assert.ok(counts[2] > 0);
  assert.ok(counts[3] > 0);
  assert.ok(counts[4] > 0);
  assert.ok(counts[5] > 0);
  assert.ok(counts[6] > 0);
};
