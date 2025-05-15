(set-logic NIA)
(set-feature :recursion true)


(declare-var x Int)


(synth-fun fy ((x Int)) Int)

(constraint (and (= (* (fy x) (fy x)) (* x x)) (>= (fy x) 0)))

(check-synth)
