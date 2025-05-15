(set-logic NIA)
(set-feature :recursion true)


(declare-var x Int)


(synth-fun fy ((x Int)) Int)

(constraint (= x (* (abs x) (fy x))))

(check-synth)
