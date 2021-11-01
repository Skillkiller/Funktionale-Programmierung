#lang racket/base

(define (my-map func lst)
  
  ;Calls the foldr function which traverses the elements from right to left
  (foldr
   
   ;Define with the lambda expression the values a and b
    (λ (a b)
      
      ;Creates a list from the function call and b
      (cons (func a) b)
     ) (list) lst)
  )