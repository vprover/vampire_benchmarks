(set-logic NIA)

(declare-var x Int)
(declare-var y Int)

(synth-fun f ((x Int) (y Int)) Int)

(constraint (= (* (f x y) x)  (+ (* x x) (* x 2)) ))

(check-synth)
