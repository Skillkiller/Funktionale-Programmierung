#lang racket/base

(require rackunit)

(define (my-length lst)
  
  ;Define the inner function which has the two parameters for foldl/r
  (define (my-length-inner p0 counter)
    
    ;Ignore the p0 parameter and increment the counter
    (+ counter 1))
  
  ;call the foldl function which runs over each element from the list
  (foldl my-length-inner 0 lst)
)

(check-equal? (my-length (list 1 2 3)) 3)

(check-equal? (my-length (list 1 2 3 4 5 6 7 8 9)) 9)
