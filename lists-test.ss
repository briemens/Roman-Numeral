(load "scheme-test.ss")
(load "lists.ss")

(displayln " === Lists Tests === ");

(test "Append 1 to an empty list results into a new list with the value 1"
      (append-list empty-list 1) equal? '(1))

(test "Append 2 to a list with the value 1 results into a list with the values 1 and 2"
      (append-list '(1) 2) equal? '(1 2))

(test "Append 3 to a list with the values 1 and 2 results into a list with the values 1, 2 and 3"
      (append-list '(1 2) 3) equal? '(1 2 3))

(test "Make-list with parameter 1 results into a list with the value 1"
      (make-list 1) equal? '(1))

(test "Insert value 2 results into a list that starts with the value 2"
      (insert-list '(9 8 7 6) 2) equal? '(2 9 8 7 6))

(test "Append value 2 results into a list that ends with the value 2"
      (append-list '(9 8 7 6) 2) equal? '(9 8 7 6 2))

(test "Last in list results into 9"
      (last-in-list '(1 2 3 4 5 6 7 8 9)) equal? 9)

(test "Count an empty list results into 0"
      (count-list empty-list) equal? 0)

(test "Count a list with 5 items results into 5"
      (count-list '(1 7 3 9 4)) equal? 5)

(displayln "");
