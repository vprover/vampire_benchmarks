;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)
(set-feature :recursion true)


(declare-var u Int)
(declare-var x Int)


(synth-fun fy ((x Int)) Int)

(constraint (=> (= (* 2 u) x) (= (* 2 (fy x)) x)))

(check-synth)
