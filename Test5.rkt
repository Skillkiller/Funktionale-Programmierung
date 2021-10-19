#lang racket/base

(require rackunit)

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
  returnValue)

(check-equal? (my-find (list 2 4 8 16) 4) #t)