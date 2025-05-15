;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u Real)
(declare-var x Real)


(synth-fun fy ((x Real)) Real)

(constraint (=> (= (* 2 u) x) (= (* 2 (fy x)) x)))

(check-synth)
