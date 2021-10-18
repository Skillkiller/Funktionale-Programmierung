#lang racket/base

(require rackunit)

(define (sum-of-the-two-highest-squares firstNumber secondNumber thirdNumber)

  ;Calculate the sums of squares of the input parameters
  (define firstSquare (* firstNumber firstNumber))
  (define secondSquare (* secondNumber secondNumber))
  (define thirdSquare (* thirdNumber thirdNumber))

  ;Save the totals in a list
  (define listOfSqaures(list firstSquare secondSquare thirdSquare))

  ;Set the list in order, highest number first
  (set! listOfSqaures (sort listOfSqaures >))

  ;Adds the two highest numbers from the list of sums and returns this one
  (+ (list-ref listOfSqaures 0) (list-ref listOfSqaures 1))
  
)

(check-equal? (sum-of-the-two-highest-squares 1 2 3) 13)

(check-equal? (sum-of-the-two-highest-squares 3 2 1) 13)

(check-equal? (sum-of-the-two-highest-squares 2 3 1) 13)
