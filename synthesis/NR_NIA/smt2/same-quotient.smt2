(set-logic NIA)

(assert-synth ((x Int)) ((y Int)) (and (= (div x 2) (div y 2)) (distinct y x)))
