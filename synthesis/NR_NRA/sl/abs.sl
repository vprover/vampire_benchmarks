(set-logic NRA)
(set-feature :recursion true)


(declare-var x Real)


(synth-fun fy ((x Real)) Real)

(constraint (and (= (* (fy x) (fy x)) (* x x)) (>= (fy x) 0)))

(check-synth)
