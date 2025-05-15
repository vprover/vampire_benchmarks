(set-logic LRA)
(set-feature :recursion true)


(declare-var x1 Real)
(declare-var x2 Real)
(declare-var x3 Real)
(declare-var x4 Real)
(declare-var x5 Real)


(synth-fun fy ((x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real)) Real)

(constraint (and (> x1 (fy x1 x2 x3 x4 x5)) (> x2 (fy x1 x2 x3 x4 x5)) (> x3 (fy x1 x2 x3 x4 x5)) (> x4 (fy x1 x2 x3 x4 x5)) (> x5 (fy x1 x2 x3 x4 x5))))

(check-synth)
