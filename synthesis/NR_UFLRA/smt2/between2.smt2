;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u Real)

(assert-synth ((x1 Real) (x2 Real) (x3 Real) (x4 Real))
  ((y Real))
  (=>
    (and (<= x1 u) (<= x2 u) (<= u x3) (<= u x4))
    (and (<= x1 y) (<= x2 y) (<= y x3) (<= y x4))
  )
)

(set-option :uncomputable (u))
