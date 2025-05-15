(set-logic NIA)
(set-feature :recursion true)


(declare-var x Int)


(synth-fun fy ((x Int)) Int)

(constraint (and (= (div x 2) (div (fy x) 2)) (distinct (fy x) x)))

(check-synth)
