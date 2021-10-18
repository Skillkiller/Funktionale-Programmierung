;Schreiben Sie eine Funktion my-reverse, die eine Liste erhält und die Elemente umdreht, also bspw. "(my-reverse '(1 2 3))" führt zu "`(3 2 1)".

#lang racket

(define (my-reverse inputList)
  
  ;Create an empty list in which the elements are stored in reverse order
  (define reversedList (list))

  ;Create a run variable which runs from the highest index to 0
  (define reverseIterator (length inputList))

  ;Iterates over the entire list
  (for ([i (length inputList)])
    ;Count down the run variable by one
    (set! reverseIterator (- reverseIterator 1))
    
    ;Add to the return list the element to which the run variable points to
    (set! reversedList (append reversedList (list (list-ref inputList reverseIterator)))))

  ;Returns the list containing the elements in reverse order
  reversedList)

(my-reverse '(1 2 3 c b a))