#lang racket/base

(require rackunit)

(define (sum-my-list listOfNumbers)
  
  ;Initialize the sum with 0
  (define sum 0)

  ;Iterates over the entire list
  (for ([i (length listOfNumbers)])
    ;Set the sum with the current sum to which the element of the list is summed to which the running variable points to.
    (set! sum (+ sum (list-ref listOfNumbers i))))
  
  ;Returns the sum of the list
  sum)

(check-equal? (sum-my-list (list 77 33)) 110)