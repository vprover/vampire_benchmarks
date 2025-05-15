(set-logic NRA)

(assert-synth ((x1 Real))
    ((y Real))
        (= (* y x1) (+ (* x1 x1) (* x1 2)))
    )
