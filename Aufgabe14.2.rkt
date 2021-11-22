#lang racket
 
(provide check-win)
(define (check-win data player)
  
  (define magic-square (list
                        4 9 2
                        3 5 7
                        8 1 6))
  (define return-value #f)
  
  (for ([i 9])
    (for ([j 9])
      (for ([k 9])
        (cond [(and (not(= i j)) (not(= i k)) (not(= j k)))
          (cond [(and (= (list-ref data i) player) (= (list-ref data j) player) (= (list-ref data k) player))   
            (cond [(= (+ (list-ref magic-square i) (list-ref magic-square j) (list-ref magic-square k)) 15)
              (set! return-value #t)
            ])
          ])
        ])
      )
    )
  )

  return-value
)


;;Unused Code Fragment
(define (get direction data index)
  (cond
    [(string=? direction "LEFT")
     (cond [(or (= index 0) (= index 3) (= index 6)) -1]
           [else (list-ref data (- index 1))])
    ]
    [(string=? direction "RIGHT")
     (cond [(or (= index 2) (= index 5) (= index 8)) -1]
           [else (list-ref data (+ index 1))])
    ]
    [(string=? direction "BOTTOM")
     (cond [(> index 5) -1]
           [else (list-ref data (+ index 3))])
    ]
    [(string=? direction "UP")
     (cond [(< index 3) -1]
           [else (list-ref data (- index 3))])
    ]

  )
)