(load "lists.ss")

(define (first list) 
  (cond ((empty-list? list) empty-list)
        (else (car list))))

(define (first-in list) (first list))
(define (rest-of list) (cdr list))
(define (next-in list) (rest-of list))

(define (make-pair key value) (key value))
(define (key pair) (first-in pair))
(define (value pair) 
  (cond ((empty-list? pair) empty-list)
        (else (first (rest-of pair)))))

(define (first-pair-in list) (first-in list))
(define (first-pair-key-in dict) (key (first-pair-in dict)))
(define (first-pair-value-in dict) (value (first-pair-in dict)))
(define (next-pair-in list) (first (next-in list)))
(define (next-pair-key-in dict) (key (next-pair-in dict)))
(define (next-pair-value-in dict) (value (next-pair-in dict)))

(define (make-dict) (list "*dict*"))


(define (dict-add dict key value)
  (cond ((empty-list? (next-in dict)) (set-cdr! dict (list (list key value))))
        (else (dict-add (rest-of dict) key value))))

(define (dict-add-many dict pair-list)
  (cond ((empty-list? pair-list) empty-list)
        (else (begin
                (dict-add dict (first-pair-key-in pair-list) (first-pair-value-in pair-list))
                (dict-add-many dict (rest-of pair-list))))))

(define (dict-make-many pair-list)
  (let ((d (make-dict)))
   (dict-add-many d pair-list)
   d))

(define (dict-find-pair-in dict key)
  (cond ((empty-list? (next-in dict)) empty-list)
        ((equal? (next-pair-key-in dict) key) (next-pair-in dict))
        (else (dict-find-pair-in (rest-of dict) key))))

(define (dict-has-key? dict key)
  (cond ((empty-list? (dict-find-pair-in dict key)) #f)
        (else #t)))

(define (dict-for-each-in dict f)
  (cond ((empty-list? (next-pair-in dict)) empty-list)
        (else (f (next-pair-in dict))
         (dict-for-each-in (rest-of dict) f))))

(define (dict-get-value dict key)
 (value (dict-find-pair-in dict key)))

(define (dict-get-keys-from dict)
   (cond ((empty-list? (next-in dict)) empty-list)
        (else (cons (next-pair-key-in dict) (dict-get-keys-from (rest-of dict))))))

(define (dict-get-values-from dict)
   (cond ((empty-list? (next-in dict)) empty-list)
        (else (cons (next-pair-value-in dict) (dict-get-values-from (rest-of dict))))))
