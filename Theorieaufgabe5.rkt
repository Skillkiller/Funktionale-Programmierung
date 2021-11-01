#lang racket

(define (call-5-times-add)
  (+ 1 1)
)

(define (call-5-times-mult)
  (* 1 1)
)



(define (call-5-times f)
  (f)
)