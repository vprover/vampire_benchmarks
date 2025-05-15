(set-logic NIA)
(set-feature :recursion true)


(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)


(synth-fun fy ((x1 Int) (x2 Int) (x3 Int)) Int)

(constraint (= (* (fy x1 x2 x3) (fy x1 x2 x3)) (+ (+ (+ (+ (+ (* x1 x1) (* 2 (* x1 x2))) (* x2 x2)) (* 2 (* x2 x3))) (* x3 x3)) (* 2 (* x3 x1)))))

(check-synth)
