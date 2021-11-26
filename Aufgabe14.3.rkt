#lang racket

(require rackunit)


(define grid (list 'N 'N 'N
                   'N 'N 'N
                   'N 'N 'N))

;; TODO Fix Typo
(define (grind-index-to-list-index row column)
  (+ (* row 3) column))

(check-equal? (grind-index-to-list-index 0 0) 0) ;; grid[0][0]
(check-equal? (grind-index-to-list-index 1 0) 3) ;; grid[1][0]
(check-equal? (grind-index-to-list-index 1 2) 5) ;; grid[1][2]
(check-equal? (grind-index-to-list-index 2 2) 8) ;; grid[2][2]

(define (get-grid-row grid row)
  (define l (list))
  (for ([i 3])
    (set! l (append l (list (list-ref grid (grind-index-to-list-index row i))))))
  l)

(define (get-grid-column grid column)
  (define l (list))
  (for ([i 3])
    (set! l (append l (list (list-ref grid (grind-index-to-list-index i column))))))
  l)

(define testing-grid (list 1 2 3
                           4 5 6
                           7 8 9))

(check-equal? (get-grid-row testing-grid 0) (list 1 2 3))
(check-equal? (get-grid-row testing-grid 1) (list 4 5 6))
(check-equal? (get-grid-row testing-grid 2) (list 7 8 9))

(check-equal? (get-grid-column testing-grid 0) (list 1 4 7))
(check-equal? (get-grid-column testing-grid 1) (list 2 5 8))
(check-equal? (get-grid-column testing-grid 2) (list 3 6 9))

;; Gibt #f zurück wenn unterschiedliche Elemente in der Liste sind
;; oder gibt das jeweilige Element zurück wenn alle Elemente in der Liste gleich sind
(define (contains-only-same-symbol l)
  (define target (car l))
  (define status #t)
  (for ([i (- (length l) 1)])
    (if status
        (if (equal? target (list-ref l (+ i 1)))
            (void)
            (set! status #f))
        (void)))
  (if status
      target
      status))

(check-equal? (contains-only-same-symbol (list 'N 'N 'N)) 'N)
(check-equal? (contains-only-same-symbol (list 'N 'X 'N)) #f)
(check-equal? (contains-only-same-symbol (list 'X 'X 'O)) #f)
(check-equal? (contains-only-same-symbol (list 'O 'O 'O)) 'O)

(define (get-grid-diagonal grid)
  (define l (list))
  (for ([i 3])
    (set! l (append l (list (list-ref grid (grind-index-to-list-index i i))))))
  l)

(define (get-grid-backslash-diagonal grid)
  (define l (list))
  (for ([i 3])
    (begin
      (define ri (- 2 i))
      (set! l (append l (list (list-ref grid (grind-index-to-list-index i ri)))))))
  l)

(check-equal? (get-grid-diagonal testing-grid) (list 1 5 9))
(check-equal? (get-grid-backslash-diagonal testing-grid) (list 3 5 7))

;; Diese Methode prüft ob das Spiel in einem Endzustand angekommen ist und gibt den Gewinner zurück falls jemand gewonnen hat
;; 'Running -> Spiel ist nicht beendet
;; 'X -> Spieler X hat gewonnen
;; 'O -> Spieler O hat gewonnen
;; 'Ended -> Spiel ging unentschieden aus
(define (game-ended? grid)
  (let/ec return
    (begin
      ;; Suche nach möglichen Spielenden in den Zeilen und Spalten
      (for ([i 3])
        ;; Gibt an ob in der Reihe oder in der Zeile nach einem Ergebnis gesucht werden soll -> 0 = Zeile ; 1 = Spalte
        (for ([search-direction 2])
          (begin
            ;;Prüfe alle Zeilen nach gleichen Symbol
            (define t (contains-only-same-symbol ((if (= search-direction 0) get-grid-row get-grid-column) grid i)))
            ;; Prüfe ob das Ergebnis ein Spieler Symbol ist -> Nicht #f und Nicht 'N
            (if (and (not (equal? t #f)) (not (equal? t 'N)))
                (return t)
                (void)))))
      ;; Suche nach möglichen Spielenden in den Diagonalen
      ;; TODO
      (void)
      ;; Gibt an in welcher Diagonale nach einem möglichen Spielende gesucht werden soll -> 0 = links oben bis rechts unten ; 1 = rechts oben bis links unten
      (for ([search-direction 2])
        (begin
          ;;Prüfe alle Zeilen nach gleichen Symbol
          (define t (contains-only-same-symbol ((if (= search-direction 0) get-grid-diagonal get-grid-backslash-diagonal) grid)))
          ;; Prüfe ob das Ergebnis ein Spieler Symbol ist -> Nicht #f und Nicht 'N
          (if (and (not (equal? t #f)) (not (equal? t 'N)))
              (return t)
              (void))))

      ;; Suche nach noch freien Feldern
      (if (equal? 'N (findf (lambda (arg) (equal? arg 'N)) grid))
          (return 'Running) ;; Spiel läuft noch
          (return 'Ended)) ;; Spiel ist beendet, keine freien Felder stehen mehr zur Verfügung
      )))

;; Spiel läuft noch Prüfung
(check-equal? (game-ended? (list 'O 'O 'X
                                 'N 'N 'O
                                 'X 'N 'O)) 'Running)

;; Spiel ging unentschieden aus Prüfung
(check-equal? (game-ended? (list 'O 'O 'X
                                 'X 'X 'O
                                 'O 'X 'O)) 'Ended)

;; Prüfungen das Spieler X gewonnen hat
(check-equal? (game-ended? (list 'X 'X 'X
                                 'O 'N 'O
                                 'N 'N 'N)) 'X)

(check-equal? (game-ended? (list 'X 'O 'O
                                 'X 'X 'X
                                 'N 'O 'N)) 'X)

(check-equal? (game-ended? (list 'X 'O 'O
                                 'O 'N 'O
                                 'X 'X 'X)) 'X)

(check-equal? (game-ended? (list 'X 'X 'O
                                 'X 'O 'N
                                 'X 'O 'X)) 'X)

(check-equal? (game-ended? (list 'X 'X 'O
                                 'N 'X 'O
                                 'N 'X 'X)) 'X)

(check-equal? (game-ended? (list 'X 'O 'X
                                 'O 'N 'X
                                 'O 'X 'X)) 'X)

(check-equal? (game-ended? (list 'X 'O 'O
                                 'O 'X 'N
                                 'O 'X 'X)) 'X)

(check-equal? (game-ended? (list 'O 'O 'X
                                 'N 'X 'O
                                 'X 'N 'O)) 'X)

;; Exakt die gleichen Prüfungen nochmal für Spiel O

(check-equal? (game-ended? (list 'O 'O 'O
                                 'X 'N 'X
                                 'N 'N 'N)) 'O)

(check-equal? (game-ended? (list 'O 'X 'X
                                 'O 'O 'O
                                 'N 'X 'N)) 'O)

(check-equal? (game-ended? (list 'O 'X 'X
                                 'X 'N 'X
                                 'O 'O 'O)) 'O)

(check-equal? (game-ended? (list 'O 'O 'X
                                 'O 'X 'N
                                 'O 'X 'O)) 'O)

(check-equal? (game-ended? (list 'O 'O 'X
                                 'N 'O 'X
                                 'N 'O 'O)) 'O)

(check-equal? (game-ended? (list 'O 'X 'O
                                 'X 'N 'O
                                 'X 'O 'O)) 'O)

(check-equal? (game-ended? (list 'O 'X 'X
                                 'X 'O 'N
                                 'X 'O 'O)) 'O)

(check-equal? (game-ended? (list 'X 'X 'O
                                 'N 'O 'X
                                 'O 'N 'X)) 'O)
