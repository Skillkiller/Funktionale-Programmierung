;Schreiben Sie eine Funktion square-my-list, die eine Liste mit Zahlen erhält und eine neue Liste der Quadrate dieser Zahlen zurückliefert.

#lang racket

(define (square-my-list inputList)

  ;Creates an empty list in which the square numbers are stored
  (define outputList (list))

  ;Iterates over the entire list
  (for ([i (length inputList)])
    ;Adds the individual square numbers to the list.  Here the running variable points to a number which is multiplied by itself.
    (set! outputList (append outputList (list (* (list-ref inputList i) (list-ref inputList i) )))))
  
  ;Returns the list in which the square numbers are located
  outputList)

(square-my-list '(1 2 3 4 5))