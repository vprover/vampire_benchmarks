(set-logic NRA)

(assert-synth ((x Real)) ((y Real)) (= x (* (to_real (abs (to_int x))) y)))

