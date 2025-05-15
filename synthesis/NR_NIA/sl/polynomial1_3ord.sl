(set-logic NIA)
(set-feature :recursion true)


(declare-var x1 Int)
(declare-var x2 Int)


(synth-fun fy ((x1 Int) (x2 Int)) Int)

(constraint (= (* (* (fy x1 x2) (fy x1 x2)) (fy x1 x2)) (+ (* (* x1 x1) x1) (+ (* 3 (* (* x1 x1) x2)) (+ (* 3 (* x1 (* x2 x2))) (* (* x2 x2) x2))))))

(check-synth)
