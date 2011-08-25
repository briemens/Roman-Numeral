(define empty-list '())
(define (empty-list? l) (eq? l empty-list))
(define (!empty-list? l) (not (eq? l empty-list)))

(define (head l) (car l))
(define (tail l) (cdr l))

(define (make-list x) (cons x '()))

(define (insert-list l x) (cons x l))

(define (append-list l x)
  (cond ((empty-list? l) (cons x l))
        ((empty-list? (tail l)) (cons (head l) (cons x empty-list)))
        (else (cons (head l) (append-list (tail l) x)))))

(define (last? l) 
  (if (empty-list? (tail l)) #t #f))
      
(define (last-in-list l)
    (if (last? l) (head l)
        (last-in-list (tail l))))

(define (count-list l)
    (if (empty-list? l) 0
          (+ 1 (count-list (tail l)))))



