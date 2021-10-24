#lang racket


(define a '(1 (2 3) . 4))

(define b (list 1 2 3))

(define c (cons 1 (cons 2 (cons 3 '()))))

(define d (cons 'a 'b))

(display (list? a))
(display (pair? a))
(display "\n")
(display (list? b))
(display (pair? b))
(display "\n")
(display (list? c))
(display (pair? c))
(display "\n")
(display (list? d))
(display (pair? d))