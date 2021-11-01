#lang racket

(define lst (list 3 4 5 6 7 8))

(define (my-length lst)
  (define (my-length-inner p0 counter)
    (+ counter 1))

  (foldl my-length-inner 0 lst)
)

(display (my-length lst))