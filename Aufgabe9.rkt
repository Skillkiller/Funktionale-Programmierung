#lang racket

(define (my-length lst)
  
  ;Define the inner function which has the two parameters for foldl/r
  (define (my-length-inner p0 counter)
    ;Ignore the p0 parameter and increment the counter
    (+ counter 1))
  ;call the foldl function which runs over each element from the list
  (foldl my-length-inner 0 lst)
)
