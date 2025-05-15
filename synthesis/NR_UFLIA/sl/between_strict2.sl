;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)
(set-feature :recursion true)


(declare-var u Int)
(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)


(synth-fun fy ((x1 Int) (x2 Int) (x3 Int) (x4 Int)) Int)

(constraint (=> (and (< x1 u) (< x2 u) (< u x3) (< u x4)) (and (< x1 (fy x1 x2 x3 x4)) (< x2 (fy x1 x2 x3 x4)) (< (fy x1 x2 x3 x4) x3) (< (fy x1 x2 x3 x4) x4))))

(check-synth)
