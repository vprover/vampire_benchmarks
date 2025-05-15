;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u Real)
(declare-var x1 Real)
(declare-var x2 Real)
(declare-var x3 Real)


(synth-fun fy ((x1 Real) (x2 Real) (x3 Real)) Real)

(constraint (=> (= (* 3 u) (+ (+ x1 5) (+ x2 (* 4 x3)))) (= (* 3 (fy x1 x2 x3)) (+ (+ x1 5) (+ x2 (* 4 x3))))))

(check-synth)
