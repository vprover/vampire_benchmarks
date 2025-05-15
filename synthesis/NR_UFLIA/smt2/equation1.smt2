;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)

(declare-const u Int)

(assert-synth
  ((x Int))
  ((y Int))
  (=> (= (* 2 u) x) (= (* 2 y) x))
)

(set-option :uncomputable (u))

