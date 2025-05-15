(set-logic NRA)

(assert-synth ((x Real)) ((y Real)) (=> (distinct x 0) (= (/ y x) 1)))
