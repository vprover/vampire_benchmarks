;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)

(declare-const u Real)

(assert-synth
  ((x1 Real) (x2 Real) (x3 Real))
  ((y Real))
  (=>
    (= (* 3 u) (+ (+ x1 5) (+ x2 (* 4 x3))))
    (= (* 3 y) (+ (+ x1 5) (+ x2 (* 4 x3))))
  )
)

(set-option :uncomputable (u))
