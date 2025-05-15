;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u Real)

(assert-synth
  ((x Real))
  ((y Real))
  (=> (= (* 2 u) x) (= (* 2 y) x))
)

(set-option :uncomputable (u))

