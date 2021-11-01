#lang racket

(define (print a b)
  (display a)
  (display b)
  (display "\n")
  a
)

(foldl print 0 (list 1 2 1))

(display "\n")

(foldr print 0 (list 1 2 1))

;10
;;21
;12
;1

;10
;21
;12
;1