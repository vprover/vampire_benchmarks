;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u1 Real)

(define-fun subspec ((i1 Real) (c Real) (x1 Real)) Bool
  (and
    (or (= x1 i1) (= x1 0))
    (<= x1 c)
  )
)

(assert-synth
  ((item1 Real) (capacity Real))
  ((y1 Real))
  (=>
    (and (>= capacity 0) (>= item1 0))
    (and
      (subspec item1 capacity y1)
      (=>
        (subspec item1 capacity u1)
        (<= u1 y1)
      )
    )
  )
)

(set-option :uncomputable (u1))
