#lang racket

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

