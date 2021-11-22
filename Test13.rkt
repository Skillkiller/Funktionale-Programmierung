#lang racket

(require rackunit)


(define (get-all-leaf-nodes l)
  (cond
    ((null? l) '())
    ((pair? l)
      (append
        (get-all-leaf-nodes (car l))
        (get-all-leaf-nodes (cdr l)))
      )
    (else
      (list l)
    )
  )
)

(define (get-number-of-leaf-nodes l)
  (length (get-all-leaf-nodes l))
)

(define (sum-of-all-leaf-nodes l)
  (apply + (get-all-leaf-nodes l))
)

(define t1 '((1 . 2) . (3 . 4)))
(define t2 '((1 . (2 . 3)) . 4))


(check-equal? (get-all-leaf-nodes t1) (list 1 2 3 4))
(check-equal? (get-all-leaf-nodes t2) (list 1 2 3 4))

(check-equal? (get-number-of-leaf-nodes t1) 4)
(check-equal? (get-number-of-leaf-nodes t2) 4)

(check-equal? (sum-of-all-leaf-nodes t1) 10)
(check-equal? (sum-of-all-leaf-nodes t2) 10)