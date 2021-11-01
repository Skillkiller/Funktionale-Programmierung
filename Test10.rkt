#lang racket/base

(require rackunit)

(define (my-map func lst)
  
  ;Calls the foldr function which traverses the elements from right to left
  (foldr
   
   ;Define with the lambda expression the values a and b
    (λ (a b)
      
      ;Creates a list from the function call and b
      (cons (func a) b)
     ) (list) lst)
  )

(check-equal? (my-map add1 (list 2 4 8)) (list 3 5 9))