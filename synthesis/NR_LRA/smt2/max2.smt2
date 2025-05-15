(set-logic LRA)

(assert-synth ((x1 Real) (x2 Real))
    ((y Real))
        (and
            (>= y x1)
            (>= y x2)
            (or (= y x1) (= y x2))
))
