(set-logic NRA)

(assert-synth ((x Real)) ((y Real)) (and (= (/ x 2) (/ y 2)) (distinct y x)))
