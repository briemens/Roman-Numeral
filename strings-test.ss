#lang scheme
(load "strings.ss")
(load "scheme-test.ss")

(displayln " === Strings Tests === ");

(test "Repeat a string 0 times results in an empty string"
      (string-repeat 0 "test") equal? "")

(test "Repeat a string 1 times results in the same string"
      (string-repeat 1 "test") equal? "test")

(test "Repeat a string 3 times results in 3 times the string"
      (string-repeat 3 "test") equal? "testtesttest")

(displayln "");
