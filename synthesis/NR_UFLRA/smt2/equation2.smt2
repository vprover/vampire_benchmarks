;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u Real)

(assert-synth
  ((x1 Real) (x2 Real))
  ((y Real))
  (=>
    (= (* 2 u) (+ x1 x2))
    (= (* 2 y) (+ x1 x2))
  )
)

(set-option :uncomputable (u))
