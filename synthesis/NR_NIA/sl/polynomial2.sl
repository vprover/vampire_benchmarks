(set-logic NIA)
(set-feature :recursion true)


(declare-var x1 Int)


(synth-fun fy ((x1 Int)) Int)

(constraint (= (* (fy x1) x1) (+ (* x1 x1) (* x1 2))))

(check-synth)
