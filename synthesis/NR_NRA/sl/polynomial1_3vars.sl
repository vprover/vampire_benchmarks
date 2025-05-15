(set-logic NRA)
(set-feature :recursion true)


(declare-var x1 Real)
(declare-var x2 Real)
(declare-var x3 Real)


(synth-fun fy ((x1 Real) (x2 Real) (x3 Real)) Real)

(constraint (= (* (fy x1 x2 x3) (fy x1 x2 x3)) (+ (+ (+ (+ (+ (* x1 x1) (* 2 (* x1 x2))) (* x2 x2)) (* 2 (* x2 x3))) (* x3 x3)) (* 2 (* x3 x1)))))

(check-synth)
