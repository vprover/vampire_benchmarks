(set-logic NRA)
(set-feature :recursion true)


(declare-var x1 Real)


(synth-fun fy ((x1 Real)) Real)

(constraint (= (* (fy x1) x1) (+ (* x1 x1) (* x1 2))))

(check-synth)
