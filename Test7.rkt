#lang racket/base

(require rackunit)

(define (square-my-list inputList)

  ;Creates an empty list in which the square numbers are stored
  (define outputList (list))

  ;Iterates over the entire list
  (for ([i (length inputList)])
    ;Adds the individual square numbers to the list.  Here the running variable points to a number which is multiplied by itself.
    (set! outputList (append outputList (list (* (list-ref inputList i) (list-ref inputList i) )))))
  
  ;Returns the list in which the square numbers are located
  outputList)

(check-equal? (square-my-list (list 2 4 8)) (list 4 16 64))