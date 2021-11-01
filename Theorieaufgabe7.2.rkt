#lang racket

(define (add1 a b)
  (+ 1 a)
)

(foldl add1 0 (list 1 2 1))

(display "\n")

(foldr add1 0 (list 1 2 1))

;2


;2