;;Schreiben Sie eine Funktion, die eine natürliche Zahl n erhält und eine Liste der natürlichen Zahlen von n bis 1 erzeugt.

#lang racket

(define (numbers-from-n-to-1 n)

  ;Create an empty list which will be returned in the end
  (define numbers (list))

  ;iterate from 0 to n
  (for ([i n])
    ;Set i = i + 1 so that we start from 1 to fill the list and thus stay in the natural number space
    (set! i (+ i 1))

    ;Add the i-th element to the list, adds this at the first place
    (set! numbers (append (list i) numbers)))
    
  ;Returns the list of elements from n-1
  numbers
)

(numbers-from-n-to-1 51)