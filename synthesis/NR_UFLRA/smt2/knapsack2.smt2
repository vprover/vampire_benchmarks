;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u1 Real)
(declare-const u2 Real)

(define-fun subspec ((i1 Real) (i2 Real) (c Real) (x1 Real) (x2 Real)) Bool
  (and
    (or (= x1 i1) (= x1 0))
    (or (= x2 i2) (= x2 0))
    (<= (+ x1 x2) c)
  )
)

(assert-synth
  ((item1 Real) (item2 Real) (capacity Real))
  ((y1 Real) (y2 Real))
  (=>
    (and (>= capacity 0) (>= item1 0) (>= item2 0))
    (and
      (subspec item1 item2 capacity y1 y2)
      (=>
        (subspec item1 item2 capacity u1 u2)
        (<= (+ u1 u2) (+ y1 y2))
      )
    )
  )
)

(set-option :uncomputable (u1 u2))
