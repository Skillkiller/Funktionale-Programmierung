#lang racket/gui

(require racket/gui/base)
(require "tictactoe.rkt")

(define field-states (list 0 0 0
                           0 0 0
                           0 0 0)
)

(define player-state #f)

(define frame (new frame%
                   [label "Tic-Tac-Toe"]
                   [width 200]
                   [height 200]))
                          
(define player-turn-message (new message% [parent frame]
                          [label "Player1 turn"]))

(define panels (list))

(define (add-panel-to-frame)
  (set! panels (append panels (list (new horizontal-panel%
                                         [parent frame]
                                         [alignment '(center center)]))))
)

(define buttons (list))

(define (spawn-buttons)
  (define panel-row 0)
  (for ([i 9])
    (cond [(< i 3) 
      (set! panel-row 0)  
    ]
    [(and (>= i 3) (< i 6))
      (set! panel-row 1)  
    ]
    [else
      (set! panel-row 2)     
    ])
    
    (set! buttons (append buttons (list(new button% [parent (list-ref panels panel-row)]
             [label ""]
             [min-width 75]
             [min-height 75]
             [callback (lambda (button event)
               (cond[(= (list-ref field-states i) 0)
                 (cond [player-state
                   (set! field-states (list-set field-states i 1))
                   (send button set-label "X")
                   (send player-turn-message set-label "Player1 turn")
                   (cond[(check-win field-states 1)
                     (send player-turn-message set-label "")    
                     (send winner-message set-label "Player 2 has won!")
                     (for ([i 9])
                       (send (list-ref buttons i) enable #f)
                     )
                           
                   ])
                 ]
                 [else
                   (set! field-states (list-set field-states i 2))
                   (send button set-label "O")
                   (send player-turn-message set-label "Player2 turn")
                   (cond[(check-win field-states 2)
                     (send winner-message set-label "Player 1 has won!")
                     (send player-turn-message set-label "")
                     (for ([i 9])
                       (send (list-ref buttons i) enable #f)
                     )
                   ])
                 ])
                 (set! player-state (not player-state))
               ])
             )]))))
  )
)

(for ([i 3])
  (add-panel-to-frame)
)

(define winner-message (new message% [parent frame]
                          [label "                            "]))

(spawn-buttons)


(send frame show #t)