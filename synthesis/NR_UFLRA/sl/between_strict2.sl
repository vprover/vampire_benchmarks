;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u Real)
(declare-var x1 Real)
(declare-var x2 Real)
(declare-var x3 Real)
(declare-var x4 Real)


(synth-fun fy ((x1 Real) (x2 Real) (x3 Real) (x4 Real)) Real)

(constraint (=> (and (< x1 u) (< x2 u) (< u x3) (< u x4)) (and (< x1 (fy x1 x2 x3 x4)) (< x2 (fy x1 x2 x3 x4)) (< (fy x1 x2 x3 x4) x3) (< (fy x1 x2 x3 x4) x4))))

(check-synth)
