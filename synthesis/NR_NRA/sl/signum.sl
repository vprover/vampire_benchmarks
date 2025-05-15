(set-logic NRA)
(set-feature :recursion true)


(declare-var x Real)


(synth-fun fy ((x Real)) Real)

(constraint (= x (* (to_real (abs (to_int x))) (fy x))))

(check-synth)
