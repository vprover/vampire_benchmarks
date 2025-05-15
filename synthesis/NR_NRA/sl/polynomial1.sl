(set-logic NRA)
(set-feature :recursion true)


(declare-var x1 Real)
(declare-var x2 Real)


(synth-fun fy ((x1 Real) (x2 Real)) Real)

(constraint (= (* (fy x1 x2) (fy x1 x2)) (+ (* x1 x1) (+ (* 2 (* x1 x2)) (* x2 x2)))))

(check-synth)
