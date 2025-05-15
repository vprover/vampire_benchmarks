(set-logic NIA)
(set-feature :recursion true)


(declare-var x Int)


(synth-fun fy ((x Int)) Int)

(constraint (=> (distinct x 0) (= (div (fy x) x) 1)))

(check-synth)
