#lang racket

(define (repeated func r)
  
  ;Define the first inner function with one parameter
  (define (inner-repeated inner-source)

    ;Define the second inner function which takes two parameters
    (define (inner-inner-repeated inner-source r)
      
      ;Check if r == 0, if yes return 'inner-source' and if not call the 2nd inner function again
      (if (= r 0) inner-source
          (inner-inner-repeated
          (func inner-source)
          (- r 1))
       )
     )

    ;Call the 2nd inner function
    (inner-inner-repeated inner-source r)
  )
  inner-repeated
)