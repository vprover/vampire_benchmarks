(set-logic LRA)

(assert-synth
  ((x1 Real) (x2 Real))
  ((y Real))
    (and
        (> x1 y)
        (> x2 y)   
))
