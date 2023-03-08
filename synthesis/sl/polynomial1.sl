(set-logic NIA)

(declare-var x Int)
(declare-var y Int)

(synth-fun f ((x Int) (y Int)) Int)

(constraint (= (* (f x y) (f x y))  (+ (* x x) (* 2 (* x y)) (* y y)) ))

(check-synth)
