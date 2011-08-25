(load "math.ss")
(load "scheme-test.ss")

(displayln " === Math Tests === ");

(test "Square of -2 results in 4"
      (square -2) equal? 4)

(test "Square of 0 results in 0"
      (square 0) equal? 0)

(test "Square of 2 results in 4"
      (square 2) equal? 4)

(displayln "");
