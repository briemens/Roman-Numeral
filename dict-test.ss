(load "scheme-test.ss")
(load "dict.ss")

(displayln " === Dict Tests === ");

(test "creating a dictionary with an initial list of key value pair results into a initialized dictionary" 
      (dict-make-many
       (list '(1000 "M") '(900 "CM") '(500 "D") 
             '(400 "CD") '(100 "C") '(90 "XC") 
             '(50 "L") '(40 "XL") '(10 "X")
             '(9 "IX") '(5 "V") '(4 "IV") '(1 "I")))
        equal? 
        (list "*dict*" '(1000 "M") '(900 "CM") '(500 "D") '(400 "CD") '(100 "C") '(90 "XC") '(50 "L") '(40 "XL") '(10 "X") '(9 "IX") '(5 "V") '(4 "IV") '(1 "I")))

(test "creating a new dictionary results in a new empty dictionary" 
      (make-dict)
      equal?
      (list "*dict*"))

(test "creating a new dictionary and adding a key value pair results into a dictionary with 1 key value pair"
      (let ((dict1 (make-dict)))
            (dict-add dict1 "key1" "value1")
            dict1)
      equal?
      (list "*dict*" '("key1" "value1")))

(test "creating a new dictionary and adding 2 key value pairs results into a dictionary with 2 key value pairs"
      (let ((dict1 (make-dict)))
            (dict-add dict1 "key1" "value1")
            (dict-add dict1 "key2" "value2")
            dict1)
      equal?
      (list "*dict*" '("key1" "value1") '("key2" "value2")))

(test "Finding a pair in an empty dictionary results into returning an empty list"
      (let ((dict1 (make-dict)))
            (dict-find-pair-in dict1 "key2"))
      equal?
      empty-list)

(test "Finding the first pair on key in a dictionary results into returning the right key value pair"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-find-pair-in dict1 "key1"))
      equal?
      '("key1" "value1"))

(test "Finding an existing pair on key in a dictionary results into returning the right key value pair"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-find-pair-in dict1 "key2"))
      equal?
      '("key2" "value2"))

(test "Finding the last pair on key in a dictionary results into returning the right key value pair"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-find-pair-in dict1 "key4"))
      equal?
      '("key4" "value4"))

(test "Finding a pair with a non-existing key in a dictionary results into returning the empty list"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-find-pair-in dict1 "key99"))
      equal?
      empty-list)

(test "Getting the value of a pair in an empty dictionary with a non-existing key results into returning the empty list"
      (let ((dict1 (make-dict)))
            (dict-get-value dict1 "key"))
      equal?
      empty-list)

(test "Getting the value of the first pair in a dictionary with a key results into returning the right value"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-get-value dict1 "key1"))
      equal?
      "value1")

(test "Getting the value of a pair in a dictionary with a key results into returning the right value"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-get-value dict1 "key2"))
      equal?
      "value2")

(test "Getting the value of the last pair in a dictionary with a key results into returning the right value"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-get-value dict1 "key4"))
      equal?
      "value4")

(test "Getting the value of a pair in a dictionary with a non-existing key results into returning the empty list"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (dict-get-value dict1 "key99"))
      equal?
      empty-list)

(test "Getting the next pair's key in an empty dictionary results into returning the empty list"
      (let ((dict1 (make-dict)))
            (next-pair-key-in dict1))
      equal?
      empty-list)

(test "Getting the next pair's value in an empty dictionary results into returning the empty list"
      (let ((dict1 (make-dict)))
            (next-pair-value-in dict1))
      equal?
      empty-list)

(test "Getting the next pair's key in dictionary results into returning the right key"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (next-pair-key-in dict1))
      equal?
      "key1")

(test "Getting the next pair's value in dictionary results into returning the right value"
      (let ((dict1 (dict-make-many (list '("key1" "value1") '("key2" "value2") '("key3" "value3") '("key4" "value4")))))
            (next-pair-value-in dict1))
      equal?
      "value1")



(displayln "");
