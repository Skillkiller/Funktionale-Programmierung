;Schreiben Sie eine Funktion my-find, die eine Liste lst und ein Argument x erhält und mittels equal? prüft, ob das Element in der Liste enthalten ist. Die Funktion soll #t antworten, wenn dem so ist, oder "#f" wenn nicht.

#lang racket

(define (my-find lst x)
  
  ;The boolean return value initialized with false
  (define returnValue #f)
  
  ;Iterates over the entire list
  (for ([i (length lst)])
    
    ;Start check
    (cond
      ;Check if the element to which the run variable points is identical to x
      [(equal? x (list-ref lst i))
       ;Set the return variable to true, because the element was found in the list
       (set! returnValue #t)]))

  ;Returns the status whether the element was found or not 
  returnValue
  )

(my-find '(1 2 3) 2)

(my-find '(1 2 3) 4)
