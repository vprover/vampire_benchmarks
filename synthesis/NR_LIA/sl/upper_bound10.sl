(set-logic LIA)
(set-feature :recursion true)


(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)
(declare-var x5 Int)
(declare-var x6 Int)
(declare-var x7 Int)
(declare-var x8 Int)
(declare-var x9 Int)
(declare-var x10 Int)


(synth-fun fy ((x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int) (x7 Int) (x8 Int) (x9 Int) (x10 Int)) Int)

(constraint (and (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x1) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x2) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x3) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x4) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x5) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x6) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x7) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x8) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x9) (>= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x10)))

(check-synth)
