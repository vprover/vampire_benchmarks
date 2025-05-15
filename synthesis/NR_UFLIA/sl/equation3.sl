;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)
(set-feature :recursion true)


(declare-var u Int)
(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)


(synth-fun fy ((x1 Int) (x2 Int) (x3 Int)) Int)

(constraint (=> (= (* 3 u) (+ (+ x1 5) (+ x2 (* 4 x3)))) (= (* 3 (fy x1 x2 x3)) (+ (+ x1 5) (+ x2 (* 4 x3))))))

(check-synth)
