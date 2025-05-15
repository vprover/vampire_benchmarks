(set-logic NRA)

(assert-synth ((x Real)) ((y Real)) (and (= (* y y) (* x x)) (>= y 0)))
