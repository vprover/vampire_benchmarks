;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u1 Real)
(declare-const u2 Real)
(declare-const u3 Real)
(declare-const u4 Real)

(define-fun subspec ((i1 Real) (i2 Real) (i3 Real) (i4 Real) (c Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real)) Bool
  (and
    (or (= x1 i1) (= x1 0))
    (or (= x2 i2) (= x2 0))
    (or (= x3 i3) (= x3 0))
    (or (= x4 i4) (= x4 0))
    (<= (+ x1 x2 x3 x4) c)
  )
)

(assert-synth
  ((item1 Real) (item2 Real) (item3 Real) (item4 Real) (capacity Real))
  ((y1 Real) (y2 Real) (y3 Real) (y4 Real))
  (=>
    (and (>= capacity 0) (>= item1 0) (>= item2 0) (>= item3 0) (>= item4 0))
    (and
      (subspec item1 item2 item3 item4 capacity y1 y2 y3 y4)
      (=>
        (subspec item1 item2 item3 item4 capacity u1 u2 u3 u4)
        (<= (+ u1 u2 u3 u4) (+ y1 y2 y3 y4))
      )
    )
  )
)

(set-option :uncomputable (u1 u2 u3 u4))
