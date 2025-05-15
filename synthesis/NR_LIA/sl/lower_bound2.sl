(set-logic LIA)
(set-feature :recursion true)


(declare-var x1 Int)
(declare-var x2 Int)


(synth-fun fy ((x1 Int) (x2 Int)) Int)

(constraint (and (>= x1 (fy x1 x2)) (>= x2 (fy x1 x2))))

(check-synth)
