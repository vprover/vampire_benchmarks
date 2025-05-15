;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u Real)

(assert-synth ((x1 Real) (x2 Real))
  ((y Real))
  (=>
    (and (<= x1 u) (<= u x2))
    (and (<= x1 y) (<= y x2))
  )
)

(set-option :uncomputable (u))
