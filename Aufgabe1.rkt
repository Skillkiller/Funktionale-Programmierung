;;Schreiben Sie eine Funktion, die drei Zahlen als Argumente übernimmt und die Summe der Quadrate der beiden größten Zahlen zurückgibt.

#lang racket

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

(sum-of-the-two-highest-squares 5 1 3)


