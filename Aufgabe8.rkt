#lang racket

(define (sum-my-list-rec listOfNumbers)

  ;Inner recurve function
  (define (inner-sum-rec numbers sum)

    ;Check if the list size is greater than 1
    (if (< (length numbers) 1)
        
        ;Returns the sum
        sum
        
        ;Adds the first element of the list to the sum and then throws it out of the list
        ;Starts the inner recursion again
        (begin
          (set! sum (+ sum (car numbers)))
          (set! numbers (remove (car numbers) numbers))
          (inner-sum-rec numbers sum))))
  
  ;Starts the inner recursion
  (inner-sum-rec listOfNumbers 0))



(define (square-my-list-rec listOfNumbers)

  ;Inner recurve function
  (define (inner-square-rec numbers listOfSquares)
    
    ;Check if the list size is greater than 1
    (if (< (length numbers) 1)
        ;Returns the list of squares
        listOfSquares
        
        ;Adds the first element of the list to the list of squares and multiply it by itself and then throws it out of the list
        ;Starts the inner recursion again
        (begin
          (set! listOfSquares (append listOfSquares (list (* (list-ref numbers 0) (list-ref numbers 0) ))))
          (set! numbers (remove (car numbers) numbers))
          (inner-square-rec numbers listOfSquares))))
  
  ;Starts the inner recursion
  (inner-square-rec listOfNumbers (list)))
