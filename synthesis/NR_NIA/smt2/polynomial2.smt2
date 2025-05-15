(set-logic NIA)

(assert-synth ((x1 Int))
    ((y Int))
        (= (* y x1) (+ (* x1 x1) (* x1 2)))
    )
