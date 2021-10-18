#lang racket/base

(require rackunit)

(define (numbers-from-n-to-1 n)

  ;Create an empty list which will be returned in the end
  (define numbers (list))

  ;iterate from 0 to n
  (for ([i n])
    ;Set i = i + 1 so that we start from 1 to fill the list and thus stay in the natural number space
    (set! i (+ i 1))

    ;Add the i-th element to the list, adds this at the first place
    (set! numbers (append (list i) numbers)))
    
  ;Returns the list of elements from n to 1
  numbers
)

(check-equal? (numbers-from-n-to-1 5) (list 5 4 3 2 1))