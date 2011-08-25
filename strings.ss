(define (string-repeat times s)
  (cond ((< times 1) "")
        ((equal? times 1) s)
        (else (string-append s (string-repeat (- times 1) s)))))

(define & string-append)
