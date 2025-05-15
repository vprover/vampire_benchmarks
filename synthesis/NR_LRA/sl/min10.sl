(set-logic LRA)
(set-feature :recursion true)


(declare-var x1 Real)
(declare-var x2 Real)
(declare-var x3 Real)
(declare-var x4 Real)
(declare-var x5 Real)
(declare-var x6 Real)
(declare-var x7 Real)
(declare-var x8 Real)
(declare-var x9 Real)
(declare-var x10 Real)


(synth-fun fy ((x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) (x8 Real) (x9 Real) (x10 Real)) Real)

(constraint (and (>= x1 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x2 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x3 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x4 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x5 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x6 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x7 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x8 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x9 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (>= x10 (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10)) (or (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x1) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x2) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x3) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x4) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x5) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x6) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x7) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x8) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x9) (= (fy x1 x2 x3 x4 x5 x6 x7 x8 x9 x10) x10))))

(check-synth)
