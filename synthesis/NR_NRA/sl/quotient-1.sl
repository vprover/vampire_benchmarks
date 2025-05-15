(set-logic NRA)
(set-feature :recursion true)


(declare-var x Real)


(synth-fun fy ((x Real)) Real)

(constraint (=> (distinct x 0) (= (/ (fy x) x) 1)))

(check-synth)
