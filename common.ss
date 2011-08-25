(define (repeat times f)
  (define (repeat-internal times c f)
    (cond ((<= c times) (begin (f c) (repeat-internal times (+ c 1) f)))))
  (repeat-internal times 0 f))
