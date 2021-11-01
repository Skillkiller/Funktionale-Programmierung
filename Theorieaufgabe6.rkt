#lang racket

(define (add1 a)
  (display "1\n")
  (+ a 1))

(define (add2 a)
  (display "2\n")
  (+ a 2))

(define (add3 a)
  (display "3\n")
  (+ a 3))

(define (add4 a)
  (display "4\n")
  (+ a 4))

(display ((compose add1 add2 add3 add4) 1))

;4
;3
;2
;1
;11