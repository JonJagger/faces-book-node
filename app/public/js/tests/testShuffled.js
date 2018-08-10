"use strict";

module.exports = testShuffled;

const shuffled = require("./../shuffled.js");
const assert = require("assert");

function testShuffled() {
  test_argument_is_not_changed();
  test_result_is_returned();
  test_result_does_not_equal_argument_for_large_array();
  test_result_is_permutation_of_argument();
}

const test_argument_is_not_changed = function() {
  const array = [1,"2",true,59];
  shuffled(array);
  assert.deepStrictEqual(array, [1,"2",true,59]);
};

const test_result_is_returned = function() {
  const result = shuffled([1,"2",true,42]);
  assert.ok(result instanceof Array);
};

const test_result_does_not_equal_argument_for_large_array = function() {
  const array = [1,2,3,4,5,6,7,8,9,10];
  const result = shuffled(array);
  assert.notEqual(array, result);
  assert.notDeepEqual(array, result);
  assert.notStrictEqual(array, result);
};

const test_result_is_permutation_of_argument = function() {
  const array = [1,2,3,4,5,6,7,8,9,10];
  const result = shuffled(array);
  assert.deepEqual(array.sort(), result.sort());
};
