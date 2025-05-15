;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)
(set-feature :recursion true)


(declare-var u Int)
(declare-var x1 Int)
(declare-var x2 Int)


(synth-fun fy ((x1 Int) (x2 Int)) Int)

(constraint (=> (= (* 2 u) (+ x1 x2)) (= (* 2 (fy x1 x2)) (+ x1 x2))))

(check-synth)
