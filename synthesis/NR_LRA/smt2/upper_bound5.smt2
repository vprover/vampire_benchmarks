(set-logic LRA)

(assert-synth (
    (x1 Real)
    (x2 Real)
    (x3 Real)
    (x4 Real)
    (x5 Real))
    ((y Real))
        (and
            (>= y x1)
            (>= y x2)
            (>= y x3)
            (>= y x4)
            (>= y x5)    
))
