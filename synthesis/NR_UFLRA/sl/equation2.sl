;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u Real)
(declare-var x1 Real)
(declare-var x2 Real)


(synth-fun fy ((x1 Real) (x2 Real)) Real)

(constraint (=> (= (* 2 u) (+ x1 x2)) (= (* 2 (fy x1 x2)) (+ x1 x2))))

(check-synth)
