#lang racket

(require "tictactoe.rkt")
(require rackunit)


(check-equal? (check-win '(0 0 1
                           0 1 0
                           1 0 0) 1) #t)
(check-equal? (check-win '(1 0 0
                           0 1 0
                           0 0 1) 1) #t)
(check-equal? (check-win '(1 1 1
                           0 0 0
                           0 0 0) 1) #t)
(check-equal? (check-win '(0 0 0
                           0 0 0
                           1 1 1) 1) #t)
(check-equal? (check-win '(1 0 0
                           1 0 0
                           1 0 0) 1) #t)
(check-equal? (check-win '(0 0 1
                           0 0 1
                           0 0 1) 1) #t)
(check-equal? (check-win '(0 1 0
                           0 1 0
                           0 1 0) 1) #t)
(check-equal? (check-win '(0 0 0
                           1 1 1
                           0 0 0) 1) #t)

(check-equal? (check-win '(0 0 2
                           0 2 0
                           2 0 0) 2) #t)
(check-equal? (check-win '(2 0 0
                           0 2 0
                           0 0 2) 2) #t)
(check-equal? (check-win '(2 2 2
                           0 0 0
                           0 0 0) 2) #t)
(check-equal? (check-win '(0 0 0
                           0 0 0
                           2 2 2) 2) #t)
(check-equal? (check-win '(2 0 0
                           2 0 0
                           2 0 0) 2) #t)
(check-equal? (check-win '(0 0 2
                           0 0 2
                           0 0 2) 2) #t)
(check-equal? (check-win '(0 2 0
                           0 2 0
                           0 2 0) 2) #t)
(check-equal? (check-win '(0 0 0
                           2 2 2
                           0 0 0) 2) #t)

(check-equal? (check-win '(0 1 0
                           2 1 2
                           2 0 0) 2) #f)
(check-equal? (check-win '(0 0 1
                           2 1 2
                           1 0 0) 2) #f)