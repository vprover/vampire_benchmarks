(set-logic LRA)
(set-feature :recursion true)


(declare-var x0 Real)
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
(declare-var x11 Real)
(declare-var x12 Real)
(declare-var x13 Real)
(declare-var x14 Real)


(synth-fun fy ((x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) (x8 Real) (x9 Real) (x10 Real) (x11 Real) (x12 Real) (x13 Real) (x14 Real)) Real)

(constraint (and (> x0 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x1 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x2 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x3 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x4 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x5 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x6 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x7 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x8 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x9 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x10 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x11 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x12 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x13 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14)) (> x14 (fy x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14))))

(check-synth)
