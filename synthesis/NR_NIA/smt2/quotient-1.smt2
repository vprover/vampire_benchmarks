(set-logic NIA)

(assert-synth ((x Int)) ((y Int)) (=> (distinct x 0) (= (div y x) 1)))
