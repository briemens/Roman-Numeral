(load "common.ss")
(load "roman.ss")
(load "scheme-test.ss")

(displayln " === Romans Tests === ");

(repeat 2015 (lambda(x) (show x (numeric->roman x))))

(test "Roman dictionary is properly loaded" 
        roman-dict
        equal? 
        (list "*dict*" '(1000 "M") '(900 "CM") '(500 "D") '(400 "CD") '(100 "C") '(90 "XC") '(50 "L") '(40 "XL") '(10 "X") '(9 "IX") '(5 "V") '(4 "IV") '(1 "I")))

(test "Roman numbers are properly loaded" 
        (dict-get-keys-from roman-dict)        
        equal? 
        '(1000 900 500 400 100 90 50 40 10 9 5 4 1))


(test "Roman symbols are properly loaded" 
        (dict-get-values-from roman-dict)        
        equal? 
        '("M" "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I"))


(test "2010 results into MMX" 
      (numeric->roman 2010) equal? "MMX")

(test "2009 results into MMIX" 
      (numeric->roman 2009) equal? "MMIX")

(displayln "");
