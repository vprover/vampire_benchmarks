(set-logic NIA)

(assert-synth ((x Int)) ((y Int)) (and (= (* y y) (* x x)) (>= y 0)))
