(set-logic LIA)
(set-feature :recursion true)


(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)
(declare-var x5 Int)


(synth-fun fy ((x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int)) Int)

(constraint (and (>= (fy x1 x2 x3 x4 x5) x1) (>= (fy x1 x2 x3 x4 x5) x2) (>= (fy x1 x2 x3 x4 x5) x3) (>= (fy x1 x2 x3 x4 x5) x4) (>= (fy x1 x2 x3 x4 x5) x5) (or (= (fy x1 x2 x3 x4 x5) x1) (= (fy x1 x2 x3 x4 x5) x2) (= (fy x1 x2 x3 x4 x5) x3) (= (fy x1 x2 x3 x4 x5) x4) (= (fy x1 x2 x3 x4 x5) x5))))

(check-synth)
