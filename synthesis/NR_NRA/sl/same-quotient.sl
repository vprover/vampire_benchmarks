(set-logic NRA)
(set-feature :recursion true)


(declare-var x Real)


(synth-fun fy ((x Real)) Real)

(constraint (and (= (/ x 2) (/ (fy x) 2)) (distinct (fy x) x)))

(check-synth)
